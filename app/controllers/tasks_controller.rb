class TasksController < ApplicationController
  respond_to :html, :json
  before_action :set_task, only: [:show, :edit, :update]

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.status = false
    if @task.save
      redirect_to dashboard_path(anchor: "task-anchor")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task.update_attributes(params[:task])
    respond_with @task
  end

  private

    def task_params
      params.permit(:name, :due_date, :priority)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
