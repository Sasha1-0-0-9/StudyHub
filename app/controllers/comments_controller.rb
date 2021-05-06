class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  def new
    @comment = Comment.new(user_id: params[:user_id], task_id: params[:task_id])
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to task_path(@comment.task)
    else
      flash.now[:error] = @comment.errors.messages
      render 'new'
    end
  end

  def show
    @active_order = Order.where(task_id: @task, status: 0)
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:success] = 'Comment successfully updated!'
    else
      flash[:danger] = 'Something wrong, sorry!'
    end
    redirect_to @comment.task
  end

  def destroy
    @comment.destroy
    redirect_to @comment.task
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :task_id, :body)
  end
end
