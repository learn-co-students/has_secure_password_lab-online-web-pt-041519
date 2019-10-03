class SessionsController < ApplicationController

  # Display login form
  def new
  end
  
  # Log user in
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      flash[:success] = "Successfully logged in" 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Credentials don't work" 
      redirect_to login_path
    end
  end

  # Log user out
  def destroy
    flash[:success] = "Successfully logged out" 
    session.clear
    redirect_to root_path
  end

end
