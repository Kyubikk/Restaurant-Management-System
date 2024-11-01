class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :tables do |t|
      t.integer :table_number
      t.integer :seating_capacity
      t.string :status

      t.timestamps
    end
  end
end
