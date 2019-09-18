class CuponBurn < ApplicationRecord
  belongs_to :cupon
  belongs_to :registration

  def self.apply_cupon(registration, cupon_percent, cupon_value_max)

  	value_auxiliary_plan = registration.plan.value 
    cupon_value_max = registration.plan.value -= cupon_value_max
    cupon_percent = value_auxiliary_plan - ((value_auxiliary_plan * cupon_percent) / 100)
    if cupon_value_max <= cupon_percent
    	value_with_discount = cupon_percent
    else
    	value_with_discount = cupon_value_max	
    end
  
		registration.payments.where(status: 'pending').order(dt_venc: :asc)
				.find_by('dt_venc > ?', Date.current)
						.update(value: value_with_discount)		
  end
end
