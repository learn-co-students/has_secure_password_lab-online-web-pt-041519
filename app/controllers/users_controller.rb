class UsersController < ApplicationController
    def new
    end

    def create

        if @user = User.create(strong_params) 
            if params[:user][:password] == params[:user][:password_confirmation]
              session[:user_id] = @user.id
              redirect_to root_path
            else
                redirect_to(controller: 'users', action: 'new')
            end 
        else
            redirect_to(controller: 'users', action: 'new')
        end
    end

    private
    def strong_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
