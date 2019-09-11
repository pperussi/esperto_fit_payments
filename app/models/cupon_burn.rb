class CuponBurn < ApplicationRecord
  belongs_to :cupon
  belongs_to :registration

  def self.off_value_registration(registration_id, cupon_value) 
    registration = Registration.find(registration_id)
    registration.value -= cupon_value 
    
  end
end
