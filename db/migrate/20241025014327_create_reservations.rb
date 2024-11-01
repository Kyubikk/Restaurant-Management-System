class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :customer, null: false, foreign_key: true
      t.datetime :reservation_date
      t.integer :number_of_guests
      t.references :table, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
