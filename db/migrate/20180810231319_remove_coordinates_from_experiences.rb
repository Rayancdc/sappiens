class RemoveCoordinatesFromExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :address, :string
    remove_column :experiences, :latitude, :float
    remove_column :experiences, :longitude, :float
  end
end
