class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      flash[:success] = "Wubba Lubba Dub Dub!!!"
      session[:user_id] = @user.id
      # binding.pry
      redirect_to dashboard_path
    else
      flash[:error] = "Whoaaa buddy, something is incorrect there"
      render :new
    end
  end

  def destroy

  end

end
