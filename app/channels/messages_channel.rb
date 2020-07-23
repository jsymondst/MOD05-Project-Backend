class MessagesChannel < ApplicationCable::Channel

  @@game_connections = Hash.new(0)


  def subscribed
    # stream_from "some_channel"
    @game = Game.find_by(id: params[:game_id])
    stream_for @game

    @game.increment!(:connections)



    @@game_connections["game#{@game.id}"] += 1

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

    @@game_connections["game#{params["game_id"]}"] -= 1

    @game = Game.find_by(id: params[:game_id])
    @game.decrement!(:connections)

  end

  def self.game_connection_count(game_id)
    return @@game_connections["game#{game_id}"]
  end

end
