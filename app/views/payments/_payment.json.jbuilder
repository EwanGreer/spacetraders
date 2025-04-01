json.extract! payment, :id, :contract_id, :payment_on_accepted, :payment_on_fulfilled, :created_at, :updated_at
json.url payment_url(payment, format: :json)
