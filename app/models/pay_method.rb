class PayMethod < ApplicationRecord
  has_many :payments
  has_many :registrations
  
  validates :name, uniqueness: true
  validates :name, :tax, :limit_days, presence: true
  validates :tax, numericality: { greater_than_or_equal_to: 0 }
  validates :limit_days, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 15  }
end
