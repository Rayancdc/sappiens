class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :experience, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
