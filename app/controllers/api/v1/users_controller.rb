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
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      token = JWT.encode({user_id: @user.id}, "plzH1reM3")
      render json: {user: @user, token: token}
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def login
    @user = User.find_by(name: params[:name], email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = JWT.encode({user_id: @user.id}, "plzH1reM3")
      render json: {user: @user, token: token}
    else
      render json: {errors: "User not found!"}
    end
  end

  def get_user_from_token
    token = request.headers["Authorization"]
    user_id = JWT.decode(token, "plzH1reM3")[0]["user_id"]

    @user = User.find_by(id: user_id)
    if @user
      render json: @user
    else
      render json: {errors: "Decode failed!"}
    end
  end

  # def user_params
  #   params.require(:user).permit(:name, :email, :password)
  # end

end
