class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :table

  # Validate số lượng khách không vượt quá sức chứa bàn
  validates :number_of_guests, numericality: { greater_than: 0 }
  validate :guests_do_not_exceed_table_capacity

  private

  def guests_do_not_exceed_table_capacity
    if table && number_of_guests > table.seating_capacity
      errors.add(:number_of_guests, "exceeds the seating capacity of the table")
    end
  end
end
