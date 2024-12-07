class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  validates :quantity, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_price, on: [:create, :update]

  def total_price
    quantity * price
  end

  private

  def set_price
    self.price ||= menu_item.price
  end
end
