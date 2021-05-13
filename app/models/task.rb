class Task < ApplicationRecord
  belongs_to :category
  has_one_attached :file
  has_one_attached :additional_file
  has_many :comments
  has_many :reviews

  validates_presence_of :title, :description, :price

  def rating
    if reviews.count == 0
      quantity = 1
    else
      quantity = reviews.count
    end
    reviews.sum(&:rating) / quantity
  end
end
