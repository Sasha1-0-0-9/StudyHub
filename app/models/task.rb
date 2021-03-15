class Task < ApplicationRecord
	belongs_to :category
	  #attr_accessible :title, :description, :price, :category_id, :author_id
	 belongs_to :owner, :foreign_key => :author_id, :class_name => "Task"
  #belongs_to :owner, :foreign_key => :user_id, :class_name => "User"
  has_many :offers 
  has_many :interested_users, :through => :offers


  	def permit_params
      params.require(:user).permit(:title, :description, :price, :category_id, :author_id, :user_id, :authenticity_token)
    end
end
