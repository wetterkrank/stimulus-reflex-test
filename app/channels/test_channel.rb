class TestChannel < ApplicationCable::Channel
  def subscribed
    stream_from connection.session_id

    Rails.logger.info "TestChannel subscribed: #{connection.session_id}"
  end

  def receive(data)
    puts data["message"]
    ActionCable.server.broadcast(connection.session_id, "ActionCable is connected")
  end
end
