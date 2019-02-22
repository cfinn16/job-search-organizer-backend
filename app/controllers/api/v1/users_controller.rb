class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: ['jobs'], status: :ok
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
