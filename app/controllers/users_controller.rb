class UsersController < ApplicationController


  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    # if user.password != user.password_confirmation
       redirect_to new_user_path
    # end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

end
