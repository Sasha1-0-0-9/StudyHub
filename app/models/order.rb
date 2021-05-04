class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :task, optional: true
  belongs_to :comment, optional: true

  enum status: %i[активне виконується виконано]
end
