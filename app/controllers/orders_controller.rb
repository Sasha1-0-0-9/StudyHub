class OrdersController < ApplicationController
		def new
		order = Order.new
	end


		def create
    #order_task = current_order.order_tasks.find_by(task_id: params[:task_id])
      order = Order.create!(client_id: 1, implementer_id: current_user.id, status: 0)
      order.errors.full_messages
      if order.save
      	redirect_to root_path
      else
      	render :new
      end
  end
end
