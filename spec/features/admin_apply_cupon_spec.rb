require 'rails_helper'
feature 'Admin apply cupon' do

  scenario 'and alter alter value' do
    user = create(:user, admin: true)
    registration = create(:registration, name: 'Outro nome')
    registration.generate_anual_payments
    carnaval = create(:promotion, name: 'Carnaval', cod_promotion: 'CARNA', discount_max: 20, value_percent_discount: 10)
    cupon = create(:cupon,promotion_id:carnaval.id)

    login_as(user)
    visit promotions_path
    click_on carnaval.name

    fill_in 'Código do cupom', with: cupon.code
    fill_in 'Número da matricula', with: registration.id
    click_on 'Aplicar'

    within("##{cupon.id}") do
      click_on cupon.code
    end

    expect(page).to have_css('h2', text: registration.name)
  end

  scenario 'usage  in two registration cupon' do
    user = create(:user, admin: true)
    registration = create(:registration, name: 'Outro nome')
    registration.generate_anual_payments
    carnaval = create(:promotion, name: 'Carnaval', cod_promotion: 'CARNA', discount_max: 20, value_percent_discount: 10)
    cupon = create(:cupon,promotion_id:carnaval.id)
    CuponBurn.create(cupon:cupon,registration:registration)
    CuponBurn.apply_cupon(registration,carnaval.value_percent_discount,carnaval.discount_max)
    cupon.applied!

    login_as(user)
    visit promotions_path
    click_on carnaval.name

    fill_in 'Código do cupom', with: cupon.code
    fill_in 'Número da matricula', with: registration.id
    click_on 'Aplicar'

    expect(page).to have_content('Cupom já foi utilizado;')
  end
  scenario 'usage  in two registration cupon' do
    user = create(:user, admin: true)
    registration = create(:registration, name: 'Outro nome')
    registration.generate_anual_payments
    carnaval = create(:promotion, name: 'Carnaval', cod_promotion: 'CARNA', discount_max: 20, value_percent_discount: 10,end_promotion:'10-09-2019')
    cupon = create(:cupon,promotion_id:carnaval.id)

    login_as(user)
    visit promotions_path
    click_on carnaval.name

    fill_in 'Código do cupom', with: cupon.code
    fill_in 'Número da matricula', with: registration.id
    click_on 'Aplicar'

    expect(page).to have_content('Esta promoçāo já foi encerrada')
  end

end