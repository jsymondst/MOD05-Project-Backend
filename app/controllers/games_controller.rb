class GamesController < ApplicationController

    def index
        games = Game.all
        render json: { games: games}
    end

    def create

       



        game = Game.new(game_params)
        game.save

        GamesController.broadcast_lobby_status
        # if game.save
        #     serialized_data = ActiveModelSerializers::Adapter::Json.new(
        #         GameSerializer.new(game)
        #     ).serializable_hash
        #     ActionCable.server.broadcast 'games_channel', serialized_data
        #     head :ok
        # end

    
    end

    def self.broadcast_lobby_status


        allGames = Game.all.map{
            |game|
            {
                name: game.name,
                id: game.id,
                created_at: game.created_at
            }
        }
    
        lobby_status = {
            connections: GamesChannel.connection_count,
            games: allGames
        }

        ActionCable.server.broadcast 'games_channel', {lobby_status: lobby_status}
        # head :ok
    
    end



    def destroy
        game = Game.find_by(id: params[:id])
        game.destroy

        GamesController.broadcast_lobby_status

    
    end

    

    private

    def game_params
        params.require(:game).permit(:name)
    end

end
