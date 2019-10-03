class UsersController < ApplicationController
    def new
    end

    def create
        if params[:user][:password] != params[:user][:password_confirmation]
            redirect_to signup_path
        else
            @user = User.create(user_params)
            session[:user_id] = User.last.id
            redirect_to home_path
        end
    end

    def home
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
