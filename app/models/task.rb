class Task < ApplicationRecord
  belongs_to :category
  has_one_attached :file
  has_one_attached :additional_file
  has_many :comments
  has_many :reviews

  def permit_params
    params.require(:user).permit(:title, :description, :price, :category_id, :author_id, :user_id,
                                 :authenticity_token)
  end

  def rating
    quantity = if reviews.count == 0
      quantity = 1
    else
      quantity = reviews.count
    end
    reviews.sum(&:rating) / quantity
  end
end
