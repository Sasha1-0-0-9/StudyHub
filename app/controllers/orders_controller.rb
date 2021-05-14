class OrdersController < ApplicationController
  helper_method :appoint_order

  def show
    @order = Order.find(params[:id])
  end

  def appoint
    Order.where(task_id: params[:task_id]).update(implementer_id: params[:implementer_id], status: 1)
    redirect_to root_path
  end

  def complete
    Order.where(task_id: params[:task_id]).update(status: 2)
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :task_id, :body, :implementer_id)
  end
end
