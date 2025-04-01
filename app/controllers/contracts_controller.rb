class ContractsController < ApplicationController
  before_action :set_contract, only: %i[ show edit update destroy ]

  # GET /contracts or /contracts.json
  def index
    @contracts = Contract.all

    client = ApiClient.new(current_user)
    resp = client.get_contracts
    unless resp.success?
      Rails.logger.error("Registration API failed: #{resp.body}")
      flash[:error] = "Agent registration failed with external service."
      render :new and return
    end

    response_hash = resp.parsed_response
    Rails.logger.info response_hash

    response_hash["data"].each do |contract_data|
      agent = Agent.find_by(id: current_user.active_agent)
      ContractSyncService.sync(contract_data, agent)
    end
  end

  # GET /contracts/1 or /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts or /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: "Contract was successfully created." }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1 or /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: "Contract was successfully updated." }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1 or /contracts/1.json
  def destroy
    @contract.destroy!

    respond_to do |format|
      format.html { redirect_to contracts_path, status: :see_other, notice: "Contract was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contract_params
      params.expect(contract: [ :external_id, :faction_symbol, :contract_type, :terms_deadline, :accepted, :fulfilled, :expiration, :deadline_to_accept ])
    end
end
