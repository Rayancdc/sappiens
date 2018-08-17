class AddTransactionToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :order_info, :string
  end
end
