class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :task
      t.integer :rating
      t.timestamps
    end
  end
end
