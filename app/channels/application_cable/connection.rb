module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # self.current_user = find_verified_user
      self.current_user = env["warden"].user || reject_unauthorized_connection
    end

    private

    def find_verified_user
      # rubocop:disable Lint/AssignmentInCondition
      if verified_user = User.find_by(id: cookies.signed['user.id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
