class Task < ApplicationRecord
  belongs_to :category
  # attr_accessible :title, :description, :price, :category_id, :author_id
  # belongs_to :owner, :foreign_key => :user_id, :class_name => "User"
 # has_many :offers
  #has_many :interested_users, through: :offers
  has_one_attached :file
  has_many :comments
  has_many :reviews
  #has_one :feedback

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
