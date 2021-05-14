class UsersController < ApplicationController
  before_action :set_user
  after_action :rating
  def index
    @user = User.all
  end

  def save_profile
    @user.update(user_params)
    redirect_to root_path
  end

  def rating
    arr = Order.where(implementer_id: @user, status: 'done').ids # отримуєм масив з айді виконаних замовлень юзера
    marks = []
    arr.each do |id| # в циклі перевіряємо завдання, які було оцінено, і вносимо оцінку до масивy marks
      mark = Task.find(Order.find(id).task.id).rating
      marks << mark if mark > 0
    end
    @user.rating = if marks.empty?
                     0
                   else
                     marks.sum / marks.size
                   end
    @user.update(rating: @user.rating)
  end

  private

  def set_user
    @user = User.find(params[:id])
    @orderlist = Order.where(client_id: @user.id).or(Order.where(implementer_id: @user.id))
  end

  def user_params
    params.require(:user).permit(:email, :avatar, :first_name, :last_name, :description, :birthday, :rating)
  end
end
