class AddForeignKeyToAgent < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :agents, :users
  end
end
