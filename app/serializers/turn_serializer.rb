class TurnSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :game_type, :action, :turn_number
end
