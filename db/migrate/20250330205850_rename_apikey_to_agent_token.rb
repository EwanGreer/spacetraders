class RenameApikeyToAgentToken < ActiveRecord::Migration[8.0]
  def change
    rename_column :agents, :apikey, :agent_token
  end
end
