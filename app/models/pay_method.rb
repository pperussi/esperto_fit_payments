class PayMethod < ApplicationRecord

  has_many :payments
  has_many :registrations

  validates :name, uniqueness: true, presence: true
  validates :tax, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :limit_days, numericality: { greater_than_or_equal_to: 1,
                                         less_than_or_equal_to: 15 },
                         presence: true
end
