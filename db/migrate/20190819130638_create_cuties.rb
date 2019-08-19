class CreateCuties < ActiveRecord::Migration[5.2]
  def change
    create_table :cuties do |t|
      t.string :ad_title
      t.string :name
      t.string :animal_type
      t.integer :age
      t.string :gender
      t.decimal :hourly_price
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
