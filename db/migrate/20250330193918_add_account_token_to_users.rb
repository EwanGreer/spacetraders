class AddAccountTokenToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :account_token, :string
    add_index :users, :account_token, unique: true
  end
end
