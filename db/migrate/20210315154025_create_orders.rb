class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :implementer_id
      t.integer :status

      t.timestamps
    end
  end
end
