class UsersController < ApplicationController

  def new 
      @user = User.new
  end 

  def create #creating a new user
     if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to new_users_path
     else 
      @user = User.create(user_params)
      session[:user_id] = @user.id
     end
  end 

  def home
  end 

  private 

  def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
  end 
  
end