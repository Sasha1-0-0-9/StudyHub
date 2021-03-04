class TasksController < InheritedResources::Base

def new
  @task = Task.new
end

def create
  @task = Task.new(task_params.merge(author_id: current_user.id))
  @task.category = Category.find(params[:task][:category_id])
  if @task.save
      redirect_to @task, notice: 'Post was successfully created.'
    else
      render :new
    end
end

def update
  @task.category = Category.find(params[:task][:category_id])
end


def show
  @task = Task.find(params[:id])
end

  private

    def set_author_post
    @post = Post.where(author_id: current_user.id).find(params[:id])
  end

    def task_params
      params.require(:task).permit(:title, :category_id, :category, :description, :price)
    end

end
