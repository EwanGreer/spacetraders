class AgentsController < ApplicationController
  before_action :set_agent, only: %i[ show edit update destroy ]

  # GET /agents or /agents.json
  def index
    @agents = @user.agents
  end

  # GET /agents/1 or /agents/1.json
  def show
    @user.active_agent = @agent.id
    @user.save

    client = ApiClient.new(@user)
    resp = client.get_contracts
    unless resp.success?
      Rails.logger.error("GetContracts API failed: #{resp.body}")
      flash[:error] = "GetContracts failed with external service."
      render :new and return
    end

    response_hash = resp.parsed_response
    response_hash["data"].each do |contract_data|
      ContractSyncService.sync(contract_data, @agent)
    end
  end

  # GET /agents/new
  def new
    @agent = Agent.new
  end

  # GET /agents/1/edit
  def edit
  end

  # POST /agents or /agents.json
  def create
    @agent = Agent.new(agent_params)

    # TODO: we should save the user in the DB before calling the API. and just delete if the API write fails.
    client = ApiClient.new(@user)
    resp = client.register(symbol: params["agent"]["symbol"], faction: params["agent"]["faction"], email: @user.email_address)
    unless resp.success?
      Rails.logger.error("Registration API failed: #{resp.body}")
      flash[:error] = "Agent registration failed with external service."
      render :new and return
    end

    response_hash = resp.parsed_response
    token = response_hash["data"]["token"]
    agent_data = response_hash["data"]["agent"]

    @agent.user = @user

    @agent.agent_token = token
    @agent.accountId = agent_data["accountId"]
    @agent.credits = agent_data["credits"]
    @agent.shipcount = agent_data["shipCount"]
    @agent.headquarters = agent_data["headquarters"]

    @user.active_agent = @agent.id
    @user.save!

    respond_to do |format|
      if @agent.save
        format.html { redirect_to @agent, notice: "Agent was successfully created." }
        format.json { render :show, status: :created, location: @agent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agents/1 or /agents/1.json
  def update
    respond_to do |format|
      if @agent.update(agent_params)
        format.html { redirect_to @agent, notice: "Agent was successfully updated." }
        format.json { render :show, status: :ok, location: @agent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1 or /agents/1.json
  def destroy
    @agent.destroy!

    respond_to do |format|
      format.html { redirect_to agents_path, status: :see_other, notice: "Agent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def agent_params
      params.expect(agent: [ :symbol, :faction, :agent_token, :user_id, :accountId, :headquarters, :credits, :shipcount ])
    end
end
