class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.text :description
      t.date :date
      t.integer :price_cents

      t.timestamps
    end
  end
end
