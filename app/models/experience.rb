class Experience < ApplicationRecord
  belongs_to :company
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :price_cents, presence: true, numericality: { only_integer: true }
end
