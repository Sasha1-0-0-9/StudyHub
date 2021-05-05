class OrdersController < ApplicationController
  before_action :set_order
  helper_method :appoint_order
  

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
