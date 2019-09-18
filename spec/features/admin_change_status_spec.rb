require 'rails_helper'

feature 'Change status' do
  scenario 'successfully' do
    user = create(:user, admin: true)
    unity = Unity.create!(name: 'Paulista')
    pay_method = create(:pay_method)
    plan = Plan.create!(name: 'Executivo', value: 70)
    registration = create(:registration, name: 'Diogo', cpf: '123456',\
                          unity_id: 1, plan_id: 1, pay_method_id: 1)
    payment = registration.payments.create!(value: 50, registration_id: 1,\
                                          pay_method_id: 1,\
                                          dt_venc: '2019-09-10 18:20:44')
    
    login_as user
    visit root_path
    click_on 'Matrículas'
    within("tr#registration-#{registration.id}") do
      click_on 'Mostrar'
    end
    within("td#payment-#{registration.payments.first.id}") do
      click_on 'Pagar'
    end
    fill_in 'Código de Transaçāo', with: 'TR001'
    fill_in 'Valor Pago', with: 70
    click_on 'Pagar' 

    expect(page).to have_css('p', text: 'paid')
  end
end