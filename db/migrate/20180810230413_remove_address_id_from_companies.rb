class RemoveAddressIdFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_reference :companies, :address, foreign_key: true
  end
end
