class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :rating
      t.text :comments

      t.timestamps
    end
  end
end
