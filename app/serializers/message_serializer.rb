class MessageSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :text, :created_at, :message_type, :username
end
