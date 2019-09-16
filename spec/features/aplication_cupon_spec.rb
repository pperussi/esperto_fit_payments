require 'rails_helper'
feature 'administrator apply cupom' do 
  scenario 'successfully' do 
    user = create(:user,admin: true)
    register = create(:registration)
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', discount_max:20,value_percent_discount:10)
    cupon = create(:cupon, promotion_id: carnaval.id)
    cupon_burned =  create(:cupon_burn, cupon: cupon, registration: register)
    CuponBurn.off_value_registration(register, cupon.promotion.value_percent_discount)

    
    visit promotions_path
    
    within('form') do 
      fill_in 'email', with: user.email 
      fill_in 'password', with: user.password
      click_on 'Log in'
    end

    visit promotion_path(carnaval)
    click_on 'Gerar cupons'
    fill_in 'Código do cupom', with: cupon.code
    fill_in 'Número da matricula', with: register.id
    click_on 'Aplicar'

    expect(page).to have_content('applied')

  end

  scenario 'and can not find cupon' do 
    user = create(:user,admin: true)
    register = create(:registration)
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', discount_max:20,value_percent_discount:10)
    cupon = create(:cupon, promotion_id: carnaval.id)
    
    visit promotions_path
    
    within('form') do 
      fill_in 'email', with: user.email 
      fill_in 'password', with: user.password
      click_on 'Log in'
    end

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
    
    visit promotions_path
    
    within('form') do 
      fill_in 'email', with: user.email 
      fill_in 'password', with: user.password
      click_on 'Log in'
    end

    visit promotion_path(carnaval)
    click_on 'Gerar cupons'
    fill_in 'Código do cupom', with: cupon.code
    fill_in 'Número da matricula', with: 42
    click_on 'Aplicar'
    
    expect(current_path).to eq promotion_path(carnaval)
    expect(page).to have_content('Matrícula nāo encontrada')
  end

end 