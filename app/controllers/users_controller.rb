class UsersController < ApplicationController
  before_action :authenticate
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'new'
    end

  end

  def destroy
    if @user.destroy
      redirect_to users_path
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :password, :about)
  end

end
