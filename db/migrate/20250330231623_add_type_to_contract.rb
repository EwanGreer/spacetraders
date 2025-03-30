class AddTypeToContract < ActiveRecord::Migration[8.0]
  def change
    add_column :contracts, :type, :string
  end
end
