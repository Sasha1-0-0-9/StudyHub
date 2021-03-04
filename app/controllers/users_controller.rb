class UsersController < ApplicationController
  def profile
  		@user = current_user
  end

  def save_profile
    @user = current_user
    @user.update(user_params)
    redirect_to root_path
  end

  private


  def user_params
  	params.require(:user).permit(:email, :first_name, :last_name, :birthday)
  end
end
