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
      flash[:alert] = "Username/password invalid"
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
    flash[:notice] = 'Goodbye'
  end
end
