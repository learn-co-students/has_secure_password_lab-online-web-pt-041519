class UsersController < ApplicationController

  def home
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(new_user_params)
    # if passwords match, create new User (save)
    # login user (create sessions[:name] = user.name)
    # redirect_to home
    if passwords_match? && user.authenticate(new_user_params[:password])
      user.save
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:notices] = user.errors
      redirect_to new_user_path
    end
  end

  private

  def new_user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def current_user
    User.find_by(name: session[:name])
  end

  def passwords_match?
    new_user_params[:password] == new_user_params[:password_confirmation]
  end

end
