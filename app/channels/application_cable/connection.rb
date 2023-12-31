module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :session_id

    def connect
      self.session_id = request.session.id
      reject_unauthorized_connection unless self.session_id
      Rails.logger.info "Connection: #{self.session_id}"
    end

  end
end

# module ApplicationCable
#   class Connection < ActionCable::Connection::Base
    # identified_by :session_id

#     def connect
#       self.session_id = request.session.id
#       reject_unauthorized_connection unless self.session_id
#     end
#   end
# end
