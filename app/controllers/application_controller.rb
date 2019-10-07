class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def home
    if session[:user_id]
      user = User.find(session[:user_id])
      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end
end
