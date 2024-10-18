class Category < ApplicationRecord
    validates :category_name, uniqueness: true
    validates :category_name, presence: true
    has_many :dishes 
end
