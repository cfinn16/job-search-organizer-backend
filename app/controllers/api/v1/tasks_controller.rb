class Api::V1::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks, status: :ok
  end

  def create
    @user_job_id = UserJob.find_by(user_id: params[:user_id], job_id: params[:job_id]).id
    @task = Task.create(description: params[:description], user_job_id: @user_job_id, is_completed: false)
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
