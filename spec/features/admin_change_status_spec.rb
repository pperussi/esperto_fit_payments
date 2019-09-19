require 'rails_helper'

feature 'Change status' do
  scenario 'successfully' do
    user = create(:user, admin: true)
    unity = create(:unity, name: 'Paulista')
    pay_method = create(:pay_method, name: 'Boleto')
    plan = create(:plan, name: 'Executivo', value: 70)
    registration = create(:registration, name: 'Diogo', cpf: '123456',\
                                         unity_id: unity.id, plan_id: plan.id,
                                         pay_method_id: pay_method.id)
    registration.generate_anual_payments

    login_as user
    visit root_path
    click_on 'Matrículas'
    click_on 'Mostrar'
    within("td#payment-#{registration.payments.first.id}") do
      click_on 'Pagar'
    end
    fill_in 'Código de Transaçāo', with: 'TR001'
    fill_in 'Valor Pago', with: 70
    click_on 'Pagar'

    expect(page).to have_content('paid')
  end
end
