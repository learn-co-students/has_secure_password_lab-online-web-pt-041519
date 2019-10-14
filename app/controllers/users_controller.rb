class UsersController < ApplicationController
    def new
    end

    def create
        user = User.create(user_params)
        if user && user.authenticate(params[:user][:password_confirmation])
            @user = user
            session[:user_id] = @user.id 
            redirect_to '/users/welcome'
        else
            redirect_to '/users/new'
        end
    end

    def welcome    
    end


    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
    
end
