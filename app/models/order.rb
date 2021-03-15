class Order < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :task, optional: true


	enum status: %i[in_progress ordered canceled]
end
