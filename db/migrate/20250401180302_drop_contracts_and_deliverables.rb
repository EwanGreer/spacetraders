class DropContractsAndDeliverables < ActiveRecord::Migration[8.0]
  def change
    drop_table :contracts, if_exists: true
    drop_table :create_deliverables, if_exists: true
    drop_table :create_contracts, if_exists: true
  end
end
