class User < ApplicationRecord

	enum role: [:student, :implementer]

	validates :role, presence: true 

	#after_initialize :set_default_role, :if => User.role.empty?

	def permit_params
      params.require(:user).permit(:email, :role)
    end

	def set_default_role
		self.role ||= student
	end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable
end
