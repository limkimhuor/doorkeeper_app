class TasksController < ApplicationController
  before_filter :authorize, only: :create

  def index
  end

  def create
    current_user.tasks.create! task_params
    redirect_to tasks_url
  end

  private
  def task_params
    params.require(:task).permit :name
  end
end
