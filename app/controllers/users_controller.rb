class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
    #redirect_to fartbag_path
  end

  def create
    @user = User.create(user_params)
    render :show
  end

  def show
    @user = User.find(params[:user_id])
  end

  # def home
    
  # end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
