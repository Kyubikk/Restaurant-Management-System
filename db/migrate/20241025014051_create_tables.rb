class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.integer :table_number, null: false, unique: true
      t.integer :seating_capacity, null: false
      t.string :status, default: 'available'

      t.timestamps
    end
  end
end
