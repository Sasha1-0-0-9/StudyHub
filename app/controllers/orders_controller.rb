class OrdersController < ApplicationController
    before_action :set_order, only: %i[edit update destroy]
    helper_method :appoint_order
  def new
    order = Order.new
  end

  def create
    # order_task = current_order.order_tasks.find_by(task_id: params[:task_id])
    order = Order.create!(client_id: current_user.id, implementer_id: params[:implementer_id], status: 1,task_id: params[:task_id])

    order.errors.full_messages
    if order.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

    def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = 'Comment successfully updated!'
    else
      flash[:danger] = 'Something wrong, sorry!'
    end
    redirect_to root_path
  end

  def show
    @order = Order.find(params[:id])
  end

  def appoint
    task_id = params[:task_id]
    implementer = params[:implementer_id]
    Order.where(task_id: task_id).update(implementer_id: implementer, status: 1)
    redirect_to root_path
  end
  
  def complete
    @order = Order.where(implementer_id: current_user).update(status: 2)
    redirect_to root_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

    def order_params
    params.require(:order).permit(:user_id, :task_id, :body, :implementer_id)
  end
end
