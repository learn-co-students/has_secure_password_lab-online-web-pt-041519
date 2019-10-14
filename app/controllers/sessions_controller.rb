class SessionsController < ApplicationController
  def new 

  end 

  def create #creating a new session
      @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
      else 
          redirect_to new_users_path
      end 
  end 


end