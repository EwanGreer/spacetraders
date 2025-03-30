class AddSelectedAgent < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :active_agent, :string
  end
end
