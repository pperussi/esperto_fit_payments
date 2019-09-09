require 'rails_helper'
feature 'administrator apply cupom' do 
  scenario 'successfully' do 
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
    fill_in 'Código do cupom', with: cupon.code
    fill_in 'Número da matricula', with: register.id
    click_on 'Aplicar'

    expect(page).to have_content('Cupom aplicado')
  end 

end 