class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate
    if !logged_in?
      redirect '/login'
    end
  end

  def authorize
    if !logged_in? || current_user.nil?
        redirect '/login'
    end
  end
end
