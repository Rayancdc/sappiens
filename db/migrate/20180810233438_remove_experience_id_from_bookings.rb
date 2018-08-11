class RemoveExperienceIdFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :experience, foreign_key: true
  end
end
