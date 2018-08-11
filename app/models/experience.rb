class Experience < ApplicationRecord

  belongs_to :company
  has_many :events, dependent: :destroy
  has_many :bookings, through: :events
  has_many :users, through: :bookings

  validates :career, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true, numericality: { only_integer: true }

  include PgSearch
  pg_search_scope :global_search,
    against: [ :career, :description ],
    associated_against: {
    	company: [ :name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `product manag` will return something!
    }

end

