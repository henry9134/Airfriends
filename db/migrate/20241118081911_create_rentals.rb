class CreateRentals < ActiveRecord::Migration[7.1]
  def change
    create_table :rentals do |t|
      t.date :booking_date
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.string :status, null: false
      t.timestamps
    end
  end
end
