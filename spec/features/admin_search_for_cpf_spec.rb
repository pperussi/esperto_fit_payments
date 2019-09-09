require 'rails_helper'

feature 'admin search registration for cpf' do
  scenario 'successfully' do
    user = create(:user, admin: true)
    registration = create(:registration,cpf:'123456')

    login_as user
    visit root_path

    fill_in 'search', with: registration.cpf
    #select

    click_on 'Procurar'

    expect(page).to include(registration.name)
    expect(page).to include(registration.cpf)

    expect(page).to include(registration.payments[0].value)
  end
end