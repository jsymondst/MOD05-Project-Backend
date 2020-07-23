class TictactoeturnsController < ApplicationController

    def create
        game = Game.find_by(id: new_turn_params[:id])

        turn = Tictactoeturn.new(new_turn_params)

        if turn.save
            render json: {turn: 
                {
                    id: turn.id,
                    game_id: turn.game_id,
                    posX: turn.posx,
                    posy: turn.posy,
                }
            }
            # broadcast_to
        end

    end




    def new_turn_params
        params.require(:turn).permit(:game_id, :action, :piece, :posx, :posy)
    end
end
