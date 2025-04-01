class DropDeliverables < ActiveRecord::Migration[8.0]
  def change
    drop_table :deliverables, if_exists: true
  end
end
