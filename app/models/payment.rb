class Payment < ApplicationRecord

  belongs_to :registration
  belongs_to :pay_method

  has_many :payment_transactions
  has_many :payments_releases

  enum status: { pending: 0, closed: 1, paid: 10 ,unpaid: 20, canceled: 30}

end