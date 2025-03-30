class RenameFactionSymbol < ActiveRecord::Migration[8.0]
  def change
    rename_column :contracts, :faction_symbol, :factionSymbol
  end
end
