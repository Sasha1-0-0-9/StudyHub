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
      @active_order = Order.create(client_id: current_user.id, status: 0, task_id: @task.id)
      redirect_to @task
      flash[:success] = 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    # @task.order = Order.find(params[:task][:order_id])
    # @task.category = Category.find(params[:task][:category_id])
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
    @order_task = Order.where(task_id: @task.id)
    @free_order = Order.where(task_id: @task.id, status: 0)
    @completed_order = Order.where(task_id: @task, client_id: current_user, status: 'done')

    @unpermitted = if @free_order.present? && !Order.where(implementer_id: current_user, status: 1).present?
                     false
                   else
                     true
                   end

    @allow_upload = if Order.where(task_id: @task, implementer_id: current_user).present? && !@task.file.present?
                      true
                    else
                      false
                    end
  end

  private

  def get_children_list
    @subcategories = Category.children_of(Category.roots.ids[0]) + Category.children_of(Category.roots.ids[1])
  end

  def task_params
    params.require(:task).permit(:title, :category_id, :category, :description, :price, :deadline, :file,
                                 :additional_file)
  end
end
