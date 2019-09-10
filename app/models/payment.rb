class Payment < ApplicationRecord
  belongs_to :registration
  belongs_to :pay_method

  enum status: { pending: 0, ok: 10 }
end
