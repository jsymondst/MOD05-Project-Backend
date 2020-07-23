class CreateTictactoeturns < ActiveRecord::Migration[6.0]
  def change
    create_table :tictactoeturns do |t|
      t.string :action
      t.string :piece
      t.string :posx
      t.string :posy
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
