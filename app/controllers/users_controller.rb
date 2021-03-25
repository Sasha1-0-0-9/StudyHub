class UsersController < ApplicationController

    def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  def profile
    @user = User.find(params[:id])
  end
  def save_profile
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :birthday)
  end
end
