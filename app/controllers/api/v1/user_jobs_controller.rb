class Api::V1::UserJobsController < ApplicationController
  def index
    @user_jobs = UserJob.all
    render json: @user_jobs, status: :ok
  end

  def create
    @user_job = UserJob.create(user_job_params)
    render json: @user_job, status: :created
  end

  def move_column
    @user_job = UserJob.where(user_id: params[:user_id], job_id: params[:job_id])
    @user_job.update(user_job_params)
    render json: @user_job, status: :accepted
  end

  def destroy
    @user_job = UserJob.where(user_id: params[:user_id], job_id: params[:job_id])
    @tasks = Task.where(user_id: params[:user_id], job_id: params[:job_id])
    byebug
    @user_job.delete
    if @tasks
      @tasks.delete
    end
  end

  def user_job_params
    params.require(:user_job).permit(:user_id, :job_id, :column)
  end

end
