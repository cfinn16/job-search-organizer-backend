class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: ['jobs.tasks'], status: :ok
  end

  def create
    byebug
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      render json: @user, status: :created
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def login
    @user = User.find_by(name: params[:name], email: params[:email])

    if @user && @user.authenticate(params[:password])
      byebug
      render json: @user.id, status: :ok
    else
      render json: {errors: "User not found!"}
    end
  end

  # def user_params
  #   params.require(:user).permit(:name, :email, :password)
  # end

end
