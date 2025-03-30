class AddAgentIdToContracts < ActiveRecord::Migration[8.0]
  def change
    add_column :contracts, :agent_id, :integer
  end
end
