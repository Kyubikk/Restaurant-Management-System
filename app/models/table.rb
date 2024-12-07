class Table < ApplicationRecord
  has_many :orders
  enum status: { available: 'available', occupied: 'occupied', reserved: 'reserved' }

  # Associations
  has_one :reservation, dependent: :destroy
  has_one :current_order, -> { where(status: 'open') }, class_name: 'Order'

  # Validations
  validates :table_number, presence: true, numericality: { only_integer: true, greater_than: 0 }, uniqueness: true
  validates :seating_capacity, inclusion: { in: [2, 4, 6, 8], message: "%{value} is not a valid seating capacity" }

  # Default status
  after_initialize :set_default_status, if: :new_record?

  # Callback để tự động thay đổi trạng thái
  after_save :update_status_based_on_order, if: :saved_change_to_status?

  private

  def set_default_status
    self.status ||= 'available'
  end

  # Cập nhật trạng thái dựa trên trạng thái của Order
  def update_status_based_on_order
    if current_order.present?
      update_column(:status, 'occupied') if available?
    elsif status == 'occupied'
      update_column(:status, 'available') unless current_order.present?
    end
  end
end
