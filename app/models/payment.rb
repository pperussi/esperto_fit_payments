class Payment < ApplicationRecord
  belongs_to :registration
  belongs_to :pay_method
  has_many :payment_transaction

  enum status: { pending: 0, paid: 10 }
end
