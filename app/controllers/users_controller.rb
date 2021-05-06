class UsersController < ApplicationController
  before_action :set_user
  after_action :rating
  def index
    @user = User.all
  end

  def profile; end

  def save_profile
    @user.update(user_params)
    redirect_to root_path
  end

  def rating
    arr = Order.where(implementer_id: @user).ids
    exc = []
    marks = []
    arr.each do |id|
      exc << Order.find(id).task.id
    end

    exc.each do |qqq|
      mark = Task.find(qqq).rating
      marks << mark if mark > 0
    end

    if @user.role == 'implementer'
      @user.rating = if marks.empty?
                       0
                     else
                       marks.sum / marks.size
                     end
      @user.update(rating: @user.rating)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :description, :birthday, :rating)
  end
end
