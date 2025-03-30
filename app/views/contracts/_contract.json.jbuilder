json.extract! contract, :id, :contract_id, :faction_symbol, :contract_type, :accepted, :fulfilled, :terms_deadline, :expiration, :deadline_to_accept, :payment_on_accepted, :payment_on_fulfilled, :terms, :created_at, :updated_at
json.url contract_url(contract, format: :json)
