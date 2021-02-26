class UsersController < ApplicationController

  def create
    @user = User.create(comment_params)

    if @user.save
      redirect_to root_path
    end
  end

  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Comment successfully updated!'
    else
      flash[:danger] = 'Something wrong, sorry!'
    end
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:email, :role)
  end
end
