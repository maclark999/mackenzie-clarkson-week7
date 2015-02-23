class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id]= @user.id
      redirect_to root_path
      flash[:notice] = 'Welcome Back!'
    else
      render 'new'
      flash[:alert] = "Username/password invalid"
    end
  end

  def destroy
  end
end
