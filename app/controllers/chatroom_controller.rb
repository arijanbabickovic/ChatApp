class ChatroomController < ApplicationController
    before_action :require_user
    
    def index
        @message = Message.new
        @messages = Message.custom_display # instead of Message.all, scope defined in the Message model
    end
    
end