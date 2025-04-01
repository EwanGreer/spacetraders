class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :contract, null: false, foreign_key: true
      t.integer :payment_on_accepted
      t.integer :payment_on_fulfilled

      t.timestamps
    end
  end
end
