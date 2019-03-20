class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = curr_user
    render json: @user, include: ['jobs', 'tasks'], status: :ok
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
    if curr_user
				render json: curr_user
			else
				render json: {errors: "WHOA! User not found!"}
			end
  end

end
