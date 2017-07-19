module Api
  module V1
    class TasksController < BaseController
      before_action :doorkeeper_authorize!
      def index
        json_response  current_user.tasks
      end

      def create
        @task = current_user.tasks.create! task_params
        json_response  @task, :created
      end

      private
      def task_params
        params.require(:task).permit :name
      end
    end
  end
end
