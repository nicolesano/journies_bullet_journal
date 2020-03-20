class TasksController < ApplicationController
  before_action :set_task, only: [:show]

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.status = false
    if @task.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

    def task_params
      params.permit(:name, :due_date, :priority)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
