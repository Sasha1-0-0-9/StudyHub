class User < ApplicationRecord
  enum role: %i[student implementer]
  has_many :owned_tasks, class_name: 'Task', foreign_key: :owner
  has_many :offers
  has_many :interested_products, through: :offers
    has_one_attached :avatar

  has_many :comments

  validates :role, presence: true

  # after_initialize :set_default_role, :if => User.role.empty?

  def permit_params
    params.require(:user).permit(:email, :first_name, :role)
  end

  def set_default_role
    self.role ||= student
  end

  def avatar_thumbnail
    if avatar.attached?
    avatar.variant(resize: "150x150!").processed
    else
    "/default_profile.jpg"
    end 
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
end
