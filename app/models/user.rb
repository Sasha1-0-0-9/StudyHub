class User < ApplicationRecord
  enum role: %i[customer contractor]
  include EnumTranslatable

  has_one_attached :avatar
  has_many :comments
  has_many :reviews
  validates :role, :first_name, :last_name, presence: true

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150x150!').processed
    else
      'ava.png'
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.role = 'customer'
      user.first_name = 'Unknown'
      user.last_name = 'User'
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
