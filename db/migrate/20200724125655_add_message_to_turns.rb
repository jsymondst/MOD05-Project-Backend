class AddMessageToTurns < ActiveRecord::Migration[6.0]
  def change
    add_column :turns, :message, :string
  end
end
