class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helpers do
    def logged_in?
      !!session[:id]
    end
    
    def current_user
      User.find_by(id: session[:id])
    end
    
    def authenticate 
      if !logged_in?
        redirect '/login'
      end
    end
  end
end
