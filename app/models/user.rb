class User < ApplicationRecord
  has_one :company, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # after_create :send_welcome_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  mount_uploader :image, PhotoUploader

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_initialize do |user|
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
    if user.provider.nil? || user.uid.nil?
      user.provider = auth.provider
      user.uid = auth.uid
    end
    user.save
    user
  end


private

  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end

end
