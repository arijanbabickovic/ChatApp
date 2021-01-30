class MessagesController < ApplicationController
  before_action :require_user

 
  def create
    # ? need to investigate further
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel",
                                    mod_message: message_render(message)
                                    # this hash is sent to chatroom.coffee
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:body)
  end
  
  def message_render(message)
    render(partial: 'message', locals: { message: message })
    # render message partial from the controller this time
  end
end