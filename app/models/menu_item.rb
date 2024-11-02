class MenuItem < ApplicationRecord
  belongs_to :cate

  validates :name, presence: true, uniqueness: true 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cate, presence: true

  has_one_attached :image

  # Thêm phương thức tìm kiếm
  def self.search(term)
    if term
      where('LOWER(name) LIKE ?', "%#{term.downcase}%")
    else
      all
    end
  end
  
end
