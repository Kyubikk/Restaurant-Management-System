class CreateCates < ActiveRecord::Migration[7.0]
  def change
    create_table :cates do |t|
      t.string :cate_name
      t.string :description

      t.timestamps
    end
  end
end
