require 'rails_helper'
feature 'Admin apply cupon' do 
  scenario 'new value plan value'do 
  user = create(:user,admin: true)
  register = create(:registration)
  carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', discount_max:20,value_percent_discount:10)
  cupon = create(:cupon, promotion_id: carnaval.id)
  cupon_burned =  create(:cupon_burn,cupon:cupon, registration:register)
  CuponBurn.off_value_registration(register,cupon.promotion.value_percent_discount)
  
  login_as(user)
  visit promotions_path
  click_on carnaval.name
  click_on 'Gerar cupons'
  fill_in 'Código do cupom', with: cupon.code
  fill_in 'Número da matricula', with: register.id
  click_on 'Aplicar'

  expect(page).to have_link(cupon.code)
  within("##{cupon.id}>span")
    expect(page).to have_css('span',text:'applied')
  end
end