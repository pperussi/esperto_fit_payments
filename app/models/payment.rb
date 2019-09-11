class Payment < ApplicationRecord
  validates :pay_method, uniqueness: true
  validates :pay_method, presence: true
  belongs_to :registration

end
