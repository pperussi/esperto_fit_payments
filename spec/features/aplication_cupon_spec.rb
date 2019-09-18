require 'rails_helper'
feature 'administrator apply cupom' do 
  scenario 'successfully' do 
    user = create(:user,admin: true)
    register = create(:registration)
    register.generate_anual_payments
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', discount_max:20,value_percent_discount:10)
    cupon = create(:cupon, promotion_id: carnaval.id)
    login_as(user)

    visit promotion_path(carnaval)
    fill_in 'Código do cupom', with: cupon.code
    fill_in 'Número da matricula', with: register.id
    click_on 'Aplicar'

    expect(page).to have_content('applied')

  end

  scenario 'and can not find cupon' do 
    user = create(:user,admin: true)
    register = create(:registration)
    register.generate_anual_payments
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', discount_max:20,value_percent_discount:10)
    cupon = create(:cupon, promotion_id: carnaval.id)
    login_as(user)
    
    visit promotion_path(carnaval)
    click_on 'Gerar cupons'
    fill_in 'Código do cupom', with: 'OLA0002'
    fill_in 'Número da matricula', with: register.id
    click_on 'Aplicar'
    
    expect(current_path).to eq promotion_path(carnaval)
    expect(page).to have_content('Cupom nāo encontrado')
  end

  scenario 'and can not find registration' do 
    user = create(:user,admin: true)
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', discount_max:20,value_percent_discount:10)
    cupon = create(:cupon, promotion_id: carnaval.id)
    login_as(user)

    visit promotion_path(carnaval)
    click_on 'Gerar cupons'
    fill_in 'Código do cupom', with: cupon.code
    fill_in 'Número da matricula', with: 42
    click_on 'Aplicar'
    
    expect(current_path).to eq promotion_path(carnaval)
    expect(page).to have_content('Matrícula nāo encontrada')
  end

end 