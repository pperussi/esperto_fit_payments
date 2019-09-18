class Promotion < ApplicationRecord
  has_many :cupons
  
  validates :name, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :value_percent_discount, presence: true, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 80 }
  validates :discount_max, presence: true, numericality: { less_than_or_equal_to: 100 } 
  validates :cod_promotion, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :cupom_number,  presence: true, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 100 }
  validates :begin_promotion, presence: true
  validate  :begin_cannot_be_in_the_past
  validates :end_promotion, presence: true 

  def begin_cannot_be_in_the_past
    return if  begin_promotion.blank?
    return unless begin_promotion.to_date < Date.current 

    errors.add(:begin_promotion,"can't be in the past")
  end
end
