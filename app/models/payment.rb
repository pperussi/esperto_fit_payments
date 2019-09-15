class Payment < ApplicationRecord

  belongs_to :registration
  belongs_to :pay_method

  has_many :payment_transactions

  enum status: {pending: 0, paid: 10, unpaid: 20}

end
