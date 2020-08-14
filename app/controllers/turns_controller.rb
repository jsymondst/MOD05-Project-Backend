class TurnsController < ApplicationController

    # def create
    #     game = Game.find_by(id: new_turn_params[:id])

    #     turn = Turn.new(new_turn_params)

    #     if turn.save
    #         turn_hash = {turn: 
    #             {
    #                 id: turn.id,
    #                 game_id: turn.game_id,
    #                 action: turn.action,
    #                 game_type: turn.game_type,
    #                 turn_number: turn.turn_number,
    #             }
    #         }

    #         # turn_hash = TurnSerializer.new(turn).serializable_hash
    #         # TurnsChannel.broadcast_to "turn_channel_#{turn.game_id}", "turn_hash"
    #         TurnsChannel.broadcast_to game , turn_hash
            
    #         render json: turn_hash
    #     end

    # end


    def create 
        
        turn = Turn.create(new_turn_params)
        game = Game.find_by(id: new_turn_params[:game_id])
        if turn.save
            turn_hash = TurnSerializer.new(turn).serializable_hash
            ActionCable.server.broadcast "turn_channel_#{turn.game_id}", {turn: turn_hash}

            if turn.message
                MessagesChannel.broadcast_to game, {text: turn.message, username:"system", type:"turn"}
            end

        else
            puts "turn not created"
        end

    end

    def index
        # GamesChannel.broadcast_to "games_channel", {key:"pancakes"}
        ActionCable.server.broadcast "games_channel", {key: "pancakes"}
        ActionCable.server.broadcast "turn_channel_5", {key: "pancakes"}

    end






    def new_turn_params
        params.require(:turn).permit(:game_id, :action, :turn_number, :game_type, :message)
    end

end
