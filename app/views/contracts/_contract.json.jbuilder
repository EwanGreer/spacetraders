json.extract! contract, :id, :external_id, :faction_symbol, :contract_type, :terms_deadline, :accepted, :fulfilled, :expiration, :deadline_to_accept, :created_at, :updated_at
json.url contract_url(contract, format: :json)
