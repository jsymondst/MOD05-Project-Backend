class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at
  has_many :messages
end
