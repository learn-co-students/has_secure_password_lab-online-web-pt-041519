class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "YO #{@user.name.capitalize}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Try again!"
      redirect_to new_user_path
    end
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
