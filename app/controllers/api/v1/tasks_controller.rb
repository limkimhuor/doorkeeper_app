module Api
  module V1
    class TasksController < BaseController
      def index
        @tasks = Task.all
        json_response  @tasks
      end

      def create
        @task = Task.create! task_params
        json_response  @task, :created
      end

      private
      def task_params
        params.permit :name
      end
    end
  end
end
