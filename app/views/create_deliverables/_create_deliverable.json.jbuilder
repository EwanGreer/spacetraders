json.extract! create_deliverable, :id, :contract_id, :trade_symbol, :destination_symbol, :units_required, :units_fulfilled, :created_at, :updated_at
json.url create_deliverable_url(create_deliverable, format: :json)
