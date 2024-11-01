class Order < ApplicationRecord
  belongs_to :reservation
  belongs_to :staff
end
