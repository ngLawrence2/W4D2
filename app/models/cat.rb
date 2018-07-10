class Cat < ApplicationRecord
  CAT_COLORS = %w[white black green yellow]
  
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: CAT_COLORS } 
  
  def age
    DateTime.now.year - birth_date.year
  end
end
