class AddAgentToUser < ActiveRecord::Migration[8.0]
  def change
    add_reference :agents, :user
  end
end
