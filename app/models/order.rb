class Order < ApplicationRecord
  belongs_to :reservation
  belongs_to :staff
  belongs_to :table
  has_many :order_items, dependent: :destroy # Quan hệ với OrderItem

  # Enum trạng thái Order
  enum status: { open: 'open', closed: 'closed' }

  # Validations
  validates :table_id, :reservation_id, :status, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  # Callback tự động tính tổng tiền khi có thay đổi
  after_save :update_total_amount

  # Phương thức tính tổng tiền
  def calculate_total_amount
    self.total_amount = order_items.sum { |item| item.quantity * item.price }
  end

  private

  def update_total_amount
    self.update_column(:total_amount, calculate_total_amount)
  end
end
