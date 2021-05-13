class ReviewsController < ApplicationController
  def new
    @review = Review.new(user_id: params[:user_id], task_id: params[:task_id])
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to root_path
    else
      flash.now[:error] = @review.errors.messages
      render 'new'
    end
  end

  def edit; end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = 'Review successfully updated!'
    else
      flash[:danger] = 'Something wrong, sorry!'
    end
    redirect_to @review.task
  end

  def destroy
    @review.destroy
    redirect_to @review.task
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :task_id, :rating)
  end
end
