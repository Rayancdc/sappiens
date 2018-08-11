class RemoveNameFromExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :name, :string
  end
end
