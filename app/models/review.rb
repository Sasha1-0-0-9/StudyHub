class Review < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates_uniqueness_of :user_id, scope: :task_id
end
