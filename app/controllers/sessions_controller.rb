class SessionsController < ApplicationController

  def new
  end

  def create
    user = currently_logging_in
    # binding.pry
    if !!user && user.authenticate(login_params[:password])
      # binding.pry
      session[:user_id] = user.id
      redirect_to home_path
    else
      # binding.pry
      flash[:notice] = "Login credentials incorrect."
      render :new
    end
  end

  def destroy
    session.delete :name
    redirect_to login_path
  end

  private

  def currently_logging_in
    # binding.pry
    User.find_by(name: params[:user][:name])
  end

  def login_params
    params.require(:user).permit(:name, :password)
  end

end
