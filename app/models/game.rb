class Game < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :tictactoeturns, dependent: :destroy
    has_many :turns, dependent: :destroy

    def self.visible_games
        return self.where(hidden:false)
    end    


end
