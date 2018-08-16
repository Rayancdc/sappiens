class RemoveDefaultImageFromUsers < ActiveRecord::Migration[5.2]
  def change
        change_column :users , :image , :string , default: nil

  end
end
