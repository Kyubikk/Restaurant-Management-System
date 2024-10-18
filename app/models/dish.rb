class Dish < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, :price, :category_id, presence: true
end
