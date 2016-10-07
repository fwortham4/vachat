module ApplicationCable
  class Connection < ActionCable::Connection::Base
  identified_by :current_user

  # This relies on the fact that you will already have handled authentication of the user, and that a successful authentication sets a signed cookie with the user_id. This cookie is then automatically sent to the connection instance when a new connection is attempted, and you use that to set the current_user.

  def connect
    self.current_user = find_verified_user
  end

  protected
    def find_verified_user
      if verified_user = env['warden'].user
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
