class Api::V1::UserJobsController < ApplicationController
  def index
    @user_jobs = UserJob.all
    render json: @user_jobs, status: :ok
  end

  def create
    @user_job = UserJob.create(user_job_params)
    render json: @user_job, status: :created
  end

  def user_job_params
    params.require(:user_job).permit(:user_id, :job_id, :column)
  end

end
