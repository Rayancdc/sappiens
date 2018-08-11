class AddCareerToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :career, :string
  end
end
