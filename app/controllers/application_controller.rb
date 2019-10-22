class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      user.name
    else
      redirect_to login_path
    end
  end

  def logged_in?
    if session[:user_id]
      true
    else
      false
    end
  end
  
end
