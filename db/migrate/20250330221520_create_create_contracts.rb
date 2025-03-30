class CreateCreateContracts < ActiveRecord::Migration[8.0]
  def change
    create_table :create_contracts do |t|
      t.string :contract_id
      t.string :faction_symbol
      t.string :contract_type
      t.boolean :accepted
      t.boolean :fulfilled
      t.datetime :terms_deadline
      t.datetime :expiration
      t.datetime :deadline_to_accept
      t.integer :payment_on_accepted
      t.integer :payment_on_fulfilled
      t.text :terms

      t.timestamps
    end
  end
end
