class Api::V1::UserJobsController < ApplicationController
  def index
    @user_jobs = UserJob.all
    render json: @user_jobs, status: :ok
  end
end
