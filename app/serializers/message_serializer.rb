class MessageSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :text, :created_at
end
