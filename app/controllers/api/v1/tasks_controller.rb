class Api::V1::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks, status: :ok
  end

  def create
    @task = Task.create(task_params)
    render json: @task, status: :created
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    render json: @task, status: :accepted
  end

  def task_params
    params.require(:task).permit(:description, :user_job_id, :is_completed)
  end

end
