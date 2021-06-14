class ChatroomController < ApplicationController
    before_action :require_user
    
    def index
        @message = Message.new
        @messages = Message.custom_display # instead of Message.all, scope defined in the Message model
        @online_users = User.where("last_seen_at > ?", 3.minutes.ago)
    end
    
end