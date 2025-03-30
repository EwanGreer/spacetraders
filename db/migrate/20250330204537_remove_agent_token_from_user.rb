class RemoveAgentTokenFromUser < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :agent_token, :string
  end
end
