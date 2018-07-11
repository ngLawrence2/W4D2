class CatRentalRequest < ApplicationRecord
  STATUSES = %w[APPROVED PENDING DENIED]
  validates :start_date, :end_date, :cat_id, :status , presence: true
  validates :status, inclusion: { in: STATUSES }
  validate :time_validator
  
  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat
    
  def overlapping_requests
  
    CatRentalRequest
      .where('start_date BETWEEN ? AND ?', start_date, end_date)
      .where(cat_id: cat_id)
      .or(CatRentalRequest
        .where('end_date BETWEEN ? AND ?', start_date, end_date)
        .where(cat_id: cat_id))
  end 
  
  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end
  
  def does_not_overlap_approved_request
    overlapping_approved_requests.empty?
  end
  
  def time_validator
    unless does_not_overlap_approved_request
      errors.add(:start_date, 'There is an overlap')
    end
  end 
   
end
