class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    return redirect_to '/login'  unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end
end

# rake routes
# (controller: 'sessions', action: 'new') = sessions#new = '/login' = login_path
