class AddTaskIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :task_id, :integer
  end
end
