class Cupon < ApplicationRecord
  belongs_to :promotion
  has_one :cupon_burn
  enum status: {active: 0, applied:8}

  def burned?
    cupon_burn.present? 
  end  

  def self.create_for(promotion)
    promotion.cupom_number.times.map do |i|  
      value = i+1
      cupon_suffix = value.to_s.rjust(4,'0')
      cupon_code = promotion.cod_promotion + cupon_suffix
      create(promotion_id: promotion.id, code: cupon_code)
    end
  end

end 
