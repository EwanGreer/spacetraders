class AddAgentIdToContract < ActiveRecord::Migration[8.0]
  def change
    add_column :contracts, :agent_id, :integer
    add_index :contracts, :agent_id
  end
end
