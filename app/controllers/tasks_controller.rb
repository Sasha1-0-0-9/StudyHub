class TasksController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :get_children_list
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
        @task = Task.find(params[:id])
       # @task.order = Order.find(params[:task][:order_id])
    #@task.category = Category.find(params[:task][:category_id])
    if @task.update(task_params)
      flash[:success] = 'Comment successfully updated!'
    else
      flash[:danger] = 'Something wrong, sorry!'
    end
    redirect_to @task
  end

  def show
    @task = Task.find(params[:id])
    @comment = @task.comments
    @review = @task.reviews
  end

  private

        def get_children_list
    @subcategories = Category.children_of(Category.roots.ids[0]) + Category.children_of(Category.roots.ids[1])
  end

  def set_author_post
    @post = Post.where(author_id: current_user.id).find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :category_id, :category, :description, :price, :file)
  end
end
