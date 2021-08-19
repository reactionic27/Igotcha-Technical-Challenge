class UsersController < ApplicationController
  skip_before_action :authenticate_request

  def register
    @user = User.create!(user_params)
    if @user.save
      render(json: { message: "User created successfully" }, status: :created)
    else
      render(json: @user.errors, status: :bad)
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def index
    authorize!(:read)

    @users = User.all
    render(json: @users)
  end

  def show
    authorize!(:read)

    @user = User.find(params[:id])
    render(json: @user)
  end

  def create
    authorize!(:create)
    @user = User.new(params.permit[:email, :password])
    @user.save
  end


  def update
    authorize!(:update)
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def destroy
    authorize!(:destroy)

    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
