class GamesChannel < ApplicationCable::Channel
  @@connection_count = 0
  def subscribed
    # stream_from "some_channel"
    stream_from "games_channel"

    @@connection_count += 1

    GamesController.broadcast_lobby_status
    
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    @@connection_count -= 1
  end

  def self.connection_count
    return @@connection_count
  end
end

