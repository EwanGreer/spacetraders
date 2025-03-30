class CreateAgents < ActiveRecord::Migration[8.0]
  def change
    create_table :agents do |t|
      t.string :symbol
      t.string :faction
      t.string :apikey

      t.timestamps
    end
  end
end
