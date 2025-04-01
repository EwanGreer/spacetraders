class CreateContracts < ActiveRecord::Migration[8.0]
  def change
    create_table :contracts do |t|
      t.string :external_id
      t.string :faction_symbol
      t.string :contract_type
      t.datetime :terms_deadline
      t.boolean :accepted
      t.boolean :fulfilled
      t.datetime :expiration
      t.datetime :deadline_to_accept

      t.timestamps
    end
  end
end
