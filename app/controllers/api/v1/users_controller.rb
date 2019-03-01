class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: ['jobs.tasks'], status: :ok
  end

  def login
    @user = User.find_by(name: params[:name], email: params[:email], password: params[:password])
    if @user
      render json: @user.id, status: :ok
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
