class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :task, optional: true
  belongs_to :comment, optional: true

#has_attached_file :document
has_one_attached :file
#validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

  enum status: %i[in_progress ordered canceled]
end
