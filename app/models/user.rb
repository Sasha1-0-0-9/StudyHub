class User < ApplicationRecord
  enum role: %i[student implementer]
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
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2 github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.role = 'student'
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.email
      user.role = 'student'
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
