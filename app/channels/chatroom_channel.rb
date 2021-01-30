class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chatroom_channel"
    # also need to create a route for this websocket connection (actioncable mounts the data in the routes.rb file)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
