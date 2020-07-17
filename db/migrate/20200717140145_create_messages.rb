class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :text
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
