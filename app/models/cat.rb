class Cat < ApplicationRecord
  CAT_COLORS = %w[white black green yellow]
  
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: CAT_COLORS } 
  
  has_many :cat_rental_requests,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy
  
  def age
    DateTime.now.year - birth_date.year
  end
end
