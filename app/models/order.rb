class Order < ApplicationRecord
  belongs_to :reservation, optional: true
  belongs_to :staff
  belongs_to :table
  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :order_items, allow_destroy: true

  enum status: { open: 'open', closed: 'closed' }

  validates :status, presence: true
  validates :table_id, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  after_initialize :set_default_status, if: :new_record?
  after_save :calculate_and_update_total_amount

  def calculate_total_amount
    order_items.sum { |item| (item.quantity || 0) * (item.price || 0) }
  end  

  validate :table_must_match_reservation, if: :reservation_present?

  private

  def set_default_status
    self.status ||= 'open'
  end

  def calculate_and_update_total_amount
    update_column(:total_amount, calculate_total_amount)
  end

  def table_must_match_reservation
    if reservation && reservation.table_id != table_id
      errors.add(:table_id, "must match the table of the reservation")
    end
  end

  def reservation_present?
    reservation.present?
  end
end
