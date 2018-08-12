class User < ApplicationRecord
  has_one :company, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # after_create :send_welcome_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

private

  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end


end
