require 'rails_helper'
describe 'registration off value' do 
  it 'Succesfully' do
    user = create(:user,admin: true)
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', discount_max:20,value_percent_discount:10)
    cupon = create(:cupon, promotion_id: carnaval.id)
    registration = create(:registration)
    registration.generate_payment
    CuponBurn.create(cupon:cupon,registration:registration)
    cupon_burned = CuponBurn.apply_cupon(registration,carnaval.value_percent_discount,carnaval.discount_max)
    expect(registration.payments[1].value).to  eq(36)
  end
end
