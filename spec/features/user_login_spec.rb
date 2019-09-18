require 'rails_helper'

feature 'User have a page to login' do
  scenario 'successfuly' do
    user = create(:user, email:'teste@teste.com', password:'123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso')
  end
  scenario "and he confirm auth of user" do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)

    visit root_path
    click_on 'Entrar'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).to have_content('BEM VINDO AO SISTEMA ADMINISTRADOR')
  end

end
