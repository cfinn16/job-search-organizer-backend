class Api::V1::JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs, status: :ok
  end

  def create
    @job = Job.create(params)
    render json: @job, status: :created
  end

  def add_from_job_listings
    @job = Job.find_by(description: params[:description])
    if @job
      @user_job = UserJob.find_by(job_id: @job.id, user_id: params[:user_id])
      if @user_job
        render json: {message: "Already on your board"}
      else
        @new_user_job = UserJob.create(job_id: @job.id, user_id: params[:user_id], column: "Interested")
        render json: @new_user_job, status: :created
      end
    else
      @new_job = Job.create(title: params[:title], company: params[:company], description: params[:description])
      render json: @new_job, status: :created
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.updated(job_params)
    render json: @event, status: :accepted
  end

  def destroy
    @job = Job.find(params[:id])
    @job.delete
  end

  # def job_params
  #   params.require(:job).permit(:title, :company, :years_experience, :salary, :contact_email, :description)
  # end

end
