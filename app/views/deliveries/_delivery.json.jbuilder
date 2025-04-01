json.extract! delivery, :id, :contract_id, :trade_symbol, :destination_symbol, :units_required, :units_fulfilled, :created_at, :updated_at
json.url delivery_url(delivery, format: :json)
