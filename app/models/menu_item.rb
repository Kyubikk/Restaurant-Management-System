class MenuItem < ApplicationRecord
  belongs_to :cate

  validates :name, presence: true, uniqueness: true 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cate, presence: true
end
