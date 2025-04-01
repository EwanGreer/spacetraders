class ApiClient
  include HTTParty
  base_uri "https://api.spacetraders.io/v2".freeze

  def initialize(user)
    @user = user
    agent_id = @user.active_agent || 0
    @agent = Agent.find_by(id: agent_id)
  end

  def register(payload = {})
    options = {
      headers: {
        "Content-Type"  => "application/json",
        "Authorization" => "Bearer #{@user.account_token}"
      },
      body: payload.to_json
    }
    Rails.logger.info "Making Request"

    self.class.post("/register", options)
  end

  def get_contracts
    options = {
      headers: {
        "Content-Type"  => "application/json",
        "Authorization" => "Bearer #{@agent.agent_token}"
      }
    }
    self.class.get("/my/contracts", options)
  end

  private

  # Fetch the API key securely from environment variables or credentials
  def api_key
    ENV["API_KEY"] || Rails.application.credentials.api_key
  end
end
