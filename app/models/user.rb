class User < ApplicationRecord
  enum role: [:student, :implementer]
  include EnumTranslatable
  
  has_one_attached :avatar

  has_many :comments

  has_many :reviews

  validates :role, presence: true

  def permit_params
    params.require(:user).permit(:email, :first_name, :role)
  end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150x150!').processed
    else
      'https://freepikpsd.com/wp-content/uploads/2019/10/default-avatar-png-3-Transparent-Images.png'
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
end
