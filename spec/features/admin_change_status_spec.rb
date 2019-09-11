require 'rails_helper'

feature 'Change status' do
  scenario 'successfully' do
    user = create(:user, admin: true)
    unity = Unity.create(name:'Paulista')
    pay_method = PayMethod.create(name:'Boleto')
    plan = Plan.create(name:'Executivo')
    registration = Registration.create(name:'Diogo',cpf:'123456',unity_id:unity,plan_id:plan,pay_method_id:pay_method)
    payment = Payment.create(value:50,registration_id:registration,pay_method_id:pay_method,dt_venc:'2019-09-10 18:20:44')
    
    login_as user
    visit root_path
    click_on 'Matrículas'

    within("tr#registration-#{registration.id}") do
      click_on 'Mostrar'
    end

    byebug
    within("tr#payment-#{registration.payments.first}") do
      click_on 'Pagar'
    end

    expect(page).to have_css('td', text:'paid')

  end
end