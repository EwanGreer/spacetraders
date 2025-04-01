class CreateDeliveries < ActiveRecord::Migration[8.0]
  def change
    create_table :deliveries do |t|
      t.references :contract, null: false, foreign_key: true
      t.string :trade_symbol
      t.string :destination_symbol
      t.integer :units_required
      t.integer :units_fulfilled

      t.timestamps
    end
  end
end
