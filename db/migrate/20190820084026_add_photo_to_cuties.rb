class AddPhotoToCuties < ActiveRecord::Migration[5.2]
  def change
    add_column :cuties, :photo, :string
  end
end
