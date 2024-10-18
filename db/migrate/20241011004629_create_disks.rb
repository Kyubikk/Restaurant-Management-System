class CreateDisks < ActiveRecord::Migration[7.0]
  def change
    create_table :disks do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
