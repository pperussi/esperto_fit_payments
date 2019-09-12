class CuponBurn < ApplicationRecord
  belongs_to :cupon
  belongs_to :registration

  def self.off_value_registration(registration, cupon_value)
    registration.plan.value = registration.plan.value - cupon_value 
  end
end
