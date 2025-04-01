class CreateAgents < ActiveRecord::Migration[8.0]
  def change
    create_table :agents do |t|
      t.string :symbol
      t.string :faction
      t.string :agent_token
      t.references :user, null: false, foreign_key: true
      t.string :accountId
      t.string :headquarters
      t.integer :credits
      t.integer :shipcount

      t.timestamps
    end
  end
end
