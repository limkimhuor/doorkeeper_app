module Api
  module V1
    class UsersController < BaseController
      before_action :doorkeeper_authorize!
      def show
        json_response current_user.as_json(except: :password_digest)
      end
    end
  end
end
