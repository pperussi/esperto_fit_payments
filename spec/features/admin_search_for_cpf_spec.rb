require 'rails_helper'

feature 'admin search registration for cpf' do
  scenario 'successfully' do
    user = create(:user, admin: true)
    registration = create(:registration, cpf: '123456')
    pay_method = create(:pay_method, name: 'Cheque')

    12.times do |i|
      create(:payment, value: registration.plan.value,\
             dt_venc: Time.zone.now.to_date + i.month,\
             registration: registration, pay_method: pay_method)
    end
    
    login_as user
    visit root_path
    fill_in 'Pesquisar por CPF:', with: registration.cpf
    click_on 'Procurar'

    expect(page).to have_content(registration.name)
    expect(page).to have_content(registration.cpf)
    expect(page).to have_content(registration.payments[0].value)
  end
end
