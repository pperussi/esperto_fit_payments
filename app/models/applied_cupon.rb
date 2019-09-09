class AppliedCupon < ApplicationRecord
  belongs_to :cupon
  belongs_to :registration
  
end
