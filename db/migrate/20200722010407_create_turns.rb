class CreateTurns < ActiveRecord::Migration[6.0]
  def change
    create_table :turns do |t|
      t.references :game, null: false, foreign_key: true
      t.string :game_type
      t.string :action
      t.integer :turn_number

      t.timestamps
    end
  end
end
