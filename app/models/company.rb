class Company < ApplicationRecord
  belongs_to :user
  has_many :experiences, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
