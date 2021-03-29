class OrdersController < ApplicationController
  def new
    order = Order.new
  end

  def create
    # order_task = current_order.order_tasks.find_by(task_id: params[:task_id])
    order = Order.create!(client_id: current_user.id, implementer_id: params[:implementer_id], status: 0,task_id: params[:task_id])

    order.errors.full_messages
    if order.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end
  
  def complete
    Order.find(params[:id]).update(status: 1)
  end
  private
    def order_params
    params.require(:order).permit(:user_id, :task_id, :body, :implementer_id)
  end
end
