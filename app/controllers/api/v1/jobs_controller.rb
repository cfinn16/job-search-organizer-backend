class Api::V1::JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs, status: :ok
  end

  def create
    @job = Job.create(job_params)
    render json: @job, status: :created
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

  def job_params
    params.require(:job).permit(:title, :company, :years_experience, :salary, :contact_email, :description)
  end

end
