class MessagesController < ApplicationController

    def create 
        
        message = Message.create(new_message_params)
        game = Game.find_by(id: new_message_params[:game_id])
        if message.save
            message_hash = MessageSerializer.new(message).serializable_hash
            MessagesChannel.broadcast_to game, message_hash
        else
            puts "message not created"
        end

    end

    private

    def new_message_params
        params.require(:message).permit([:game_id, [:text]])
    end

end
