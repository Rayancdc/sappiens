class Company < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :experiences, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
