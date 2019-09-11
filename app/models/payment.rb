class Payment < ApplicationRecord
  belongs_to :registration
  belongs_to :pay_method
end
