require 'rails_helper'

describe 'generate cupons' do 
  it 'successfully' do 
    caranaval  = create(:promotion,cod_promotion: 'CARNA',cupom_number: 3)
    cupons = Cupon.create_for(caranaval)

    expect(cupons[0].promotion_id).to eq(caranaval.id)
    expect(cupons[0].code).to eq("#{caranaval.cod_promotion}0001")
    expect(cupons[1].promotion_id).to eq(caranaval.id)
    expect(cupons[1].code).to eq("#{caranaval.cod_promotion}0002")
    expect(cupons[2].promotion_id).to eq(caranaval.id)
    expect(cupons[2].code).to eq("#{caranaval.cod_promotion}0003")

  
  end
end
