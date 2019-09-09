class PayMethod < ApplicationRecord
  has_many :payments
  has_many :registrations
  
  validates :name, uniqueness: true
  validates :name, presence: true
end
