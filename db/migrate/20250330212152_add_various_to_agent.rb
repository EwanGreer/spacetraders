class AddVariousToAgent < ActiveRecord::Migration[8.0]
  def change
    add_column :agents, :accoutnId, :string
    add_column :agents, :headquarters, :string
    add_column :agents, :credits, :integer
    add_column :agents, :shipcount, :integer
  end
end
