class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :reservation, null: false, foreign_key: true
      t.datetime :order_date
      t.references :staff, null: false, foreign_key: true
      t.string :status
      t.decimal :total_amount

      t.timestamps
    end
  end
end
