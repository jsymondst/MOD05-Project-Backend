class Game < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :tictactoeturns, dependent: :destroy
    has_many :turns, dependent: :destroy
end
