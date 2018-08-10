class Experience < ApplicationRecord

  belongs_to :company
  has_many :events, dependent: :destroy
  has_many :bookings, through: :events
  has_many :users, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :price_cents, presence: true, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :global_search,
    against: [ :name, :description ],
    associated_against: {
    	company: [ :name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `product manag` will return something!
    }

end

