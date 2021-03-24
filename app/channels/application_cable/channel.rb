module ApplicationCable
  class Channel < ActionCable::Channel::Base
  #   identified_by :current_user

  #   def connect
  #     self.current_user = current_user
    end

    private

    # def find_verified_user
    #   # rubocop:disable Lint/AssignmentInCondition
    #   if verified_user = User.find_by(id: cookies.signed['user.id'])
    #     verified_user
    #   else
    #     reject_unauthorized_connection
    #   end
    # end
end
