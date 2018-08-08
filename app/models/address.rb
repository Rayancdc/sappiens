class Address < ApplicationRecord
  has_many :companies, dependent: :destroy

  validates :field_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
end
