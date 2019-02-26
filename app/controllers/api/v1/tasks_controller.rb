class Api::V1::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks, status: :ok
  end

  def create
    @task = Task.create(task_params)
    render json: @task, status: :created
  end

  def task_params
    params.require(:task).permit(:description, :job_id)
  end

end
