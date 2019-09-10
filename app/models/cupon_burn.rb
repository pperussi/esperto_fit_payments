class CuponBurn < ApplicationRecord
  belongs_to :cupon
  belongs_to :registration
end
