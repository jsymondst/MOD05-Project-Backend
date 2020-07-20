class GamesController < ApplicationController

    def index

        allGames = Game.all.map{
            |game|
            {
                name: game.name,
                id: game.id,
                created_at: game.created_at,
                # connection_count: MessagesChannel.game_connection_count(game.id),
                connection_count: game.connections
            }
        }
        render json: {
            lobby_status:{
                games: allGames,
                connections: GamesChannel.connection_count + 1
        } 
    }
    end

    def create

        game = Game.new(game_params)
        game.save

        GamesController.broadcast_lobby_status

    end

    def self.broadcast_lobby_status


        allGames = Game.all.map{
            |game|
            {
                name: game.name,
                id: game.id,
                created_at: game.created_at,
                connection_count: game.connections,
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
