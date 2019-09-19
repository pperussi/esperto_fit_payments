require 'rails_helper'

describe 'registration off value' do
  it 'Succesfully in discount percent' do
    carnaval = create(:promotion, name: 'Carnaval', cod_promotion: 'CARNA',
      discount_max: 20, value_percent_discount: 10)
    cupon = create(:cupon, promotion_id: carnaval.id)
    registration = create(:registration)
    registration.generate_anual_payments
    CuponBurn.create(cupon: cupon, registration: registration)
    CuponBurn.apply_cupon(registration, carnaval.value_percent_discount,
      carnaval.discount_max)

    expect(registration.payments[0].value).to eq(36)
  end

  it 'fail in discount percent' do
    carnaval = create(:promotion, name: 'Carnaval', cod_promotion: 'CARNA',
      discount_max: 20, value_percent_discount: 10)
    cupon = create(:cupon, promotion_id: carnaval.id)
    plan = create(:plan, value: 2000)
    registration = create(:registration, plan: plan)
    registration.generate_anual_payments
    CuponBurn.create(cupon: cupon, registration: registration)
    CuponBurn.apply_cupon(registration, carnaval.value_percent_discount, carnaval.discount_max)

    expect(registration.payments[0].value).to eq(1980)
  end
end
