class AddClosedAndHiddenToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :closed, :boolean, default: false
    add_column :games, :hidden, :boolean, default: false
  end
end
