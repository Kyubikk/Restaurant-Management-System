class Cate < ApplicationRecord
  has_many :menu_items
    validates :cate_name, presence: true, uniqueness: true, length: { maximum: 100 }
    validates :description, length: { maximum: 500 }
  end
  