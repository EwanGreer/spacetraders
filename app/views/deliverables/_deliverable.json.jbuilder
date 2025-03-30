json.extract! deliverable, :id, :contract_id, :trade_symbol, :destination_symbol, :units_required, :units_fulfilled, :created_at, :updated_at
json.url deliverable_url(deliverable, format: :json)
