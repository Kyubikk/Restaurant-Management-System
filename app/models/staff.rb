class Staff < ApplicationRecord
    ROLES = %w[waiter chef managers admin].freeze
  
    validates :first_name, :last_name, :email, :role, presence: true
    validates :email, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, :last_name, length: { maximum: 50 }
    validates :role, inclusion: { in: ROLES, message: "%{value} is not a valid role" }
  end
  