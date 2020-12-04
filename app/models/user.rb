class User < ApplicationRecord
  has_many :tasks, through: :lists
  has_many :lists, :dependent => :destroy

  # accepts_nested_attributes_for :user, allow_destroy: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
      where(uid: auth.uid).first_or_create do |user|
          user.full_name = auth.info.full_name
          user.uid = auth.uid
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
      end
  end
end
