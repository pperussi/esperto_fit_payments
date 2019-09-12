require 'rails_helper'
describe 'registration off value' do 
  it 'Succesfully' do
    user = create(:user,admin: true)
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', discount_max:20,value_percent_discount:10)
    cupon = create(:cupon, promotion_id: carnaval.id)
    registration = create(:registration)
    cupon_burned = CuponBurn.off_value_registration(registration,carnaval.value_percent_discount)

    expect(registration.plan.value).to  eq(30)
  end
end
