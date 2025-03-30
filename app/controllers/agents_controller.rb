class AgentsController < ApplicationController
  before_action :set_agent, only: %i[ show edit update destroy ]

  # GET /agents or /agents.json
  def index
    @agents = Agent.all
  end

  # GET /agents/1 or /agents/1.json
  def show
    # TODO: create migration to convert payment on accpeted and fulfilled to booleans
    @user = current_user
    @agent = Agent.find(params[:id])

    @user.active_agent = @agent.id
    if @user.save
      client = ::ApiClient.new(@user)
      resp = client.get_contracts

      if resp.success?
        response_hash = resp.parsed_response
        Rails.logger.info("API response: #{response_hash.inspect}")

        contracts_by_id = {}

        response_hash["data"].each do |contract_hash|
          contract_id = contract_hash["id"].to_i

          if contract_hash.key?("type")
            contract_hash["contract_type"] = contract_hash.delete("type")
          end

          contract = contracts_by_id[contract_id] || Contract.find_or_initialize_by(id: contract_id)

          contract.assign_attributes(contract_hash)
          contract.agent = @agent

          contract.save!

          contracts_by_id[contract_id] = contract
        end

        @contracts = contracts_by_id.values
      else
        Rails.logger.error("API Error: #{resp.code} - #{resp.message}")
        flash[:error] = "There was an error fetching contracts."
        @contracts = []
      end
    else
      flash[:error] = "Failed to update active agent."
      @contracts = []
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
    @agent = current_user.agents.build(agent_params)

    client = ::ApiClient.new(current_user)
    resp = client.register(symbol: params[:agent][:symbol], faction: params[:agent][:faction])

    if !resp.success?
      print(resp)
      raise(resp)
    end

    response_hash = resp.parsed_response
    token = response_hash["data"]["token"]
    agent_data = response_hash["data"]["agent"]

    @agent.agent_token = token
    @agent.accountId = agent_data["accountId"]
    @agent.credits = agent_data["credits"]
    @agent.shipcount = agent_data["shipCount"]
    @agent.headquarters = agent_data["headquarters"]

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
      params.expect(agent: [ :symbol, :faction ])
    end
end
