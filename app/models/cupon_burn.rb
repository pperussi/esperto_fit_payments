class CuponBurn < ApplicationRecord
  belongs_to :cupon
  belongs_to :registration

  def self.apply_cupon(registration, cupon_value)
    value_with_discount = registration.plan.value - ((registration.plan.value * cupon_value) / 100) 

    r = registration.payments.where(status: 'pending').order(dt_venc: :asc)
          .find_by('dt_venc > ?', Date.current)
            .update(value: value_with_discount)



    # registration.plan.value.update(value: value_with_discount)
    
  end
end
