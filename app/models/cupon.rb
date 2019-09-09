class Cupon < ApplicationRecord
  belongs_to :promotion

  def self.create_for(promotion)

    promotion.cupom_number.times.map do |i|  
      value = i+1
      cupon_suffix = value.to_s.rjust(4,'0')
      cupon_code = promotion.cod_promotion + cupon_suffix
      create(promotion_id: promotion.id, code: cupon_code)
    end
  end

end
