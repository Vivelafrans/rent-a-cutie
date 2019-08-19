class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :rental_price
      t.references :cutie, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
