require 'pry'
class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        if params[:user][:password] != params[:user][:password_confirmation] && params[:user][:password_confirmation] != nil
            redirect_to new_user_path
        elsif params[:user][:password] == params[:user][:password_confirmation] || params[:user][:password_confirmation] = nil
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to homepage_path            
        end
    end 

    def homepage
        
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end