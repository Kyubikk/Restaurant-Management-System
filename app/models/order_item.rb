class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  # Validations
  validates :quantity, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # Tổng giá của món
  def total_price
    quantity * price
  end
end
