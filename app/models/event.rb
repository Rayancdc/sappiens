class Event < ApplicationRecord
  belongs_to :experience
  has_one :booking
end
