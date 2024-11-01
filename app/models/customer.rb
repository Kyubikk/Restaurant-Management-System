class Customer < ApplicationRecord
    has_many :orders
    has_many :feedbacks
  
    # Các validations cơ bản
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
    # Validation cho số điện thoại, nếu có cột phone_number
    validates :phone_number, format: { with: /\A\d{10,15}\z/, message: "chỉ chứa số và từ 10-15 ký tự" }, allow_blank: true
  
    # Giới hạn độ dài của tên để tránh các giá trị quá dài
    validates :first_name, :last_name, length: { maximum: 50 }
  end
  