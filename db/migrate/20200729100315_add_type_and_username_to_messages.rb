class AddTypeAndUsernameToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :message_type, :string
    add_column :messages, :username, :string
  end
end
