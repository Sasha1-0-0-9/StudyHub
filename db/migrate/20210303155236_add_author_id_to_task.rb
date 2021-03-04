class AddAuthorIdToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :author_id, :integer
  end
end
