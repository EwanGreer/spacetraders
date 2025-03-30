class AddAgentTokenToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :agent_token, :string
  end
end
