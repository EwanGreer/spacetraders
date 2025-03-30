class RenameAccoutnIdToAccountId < ActiveRecord::Migration[8.0]
  def change
    rename_column :agents, :accoutnId, :accountId
  end
end
