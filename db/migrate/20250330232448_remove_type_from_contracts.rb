class RemoveTypeFromContracts < ActiveRecord::Migration[8.0]
  def change
    remove_column :contracts, :type, :string
  end
end
