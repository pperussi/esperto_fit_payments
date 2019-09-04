require 'rails_helper'

describe 'User have a page to login' do
  scenario 'successfuly' do
    user = create(:user, email:'teste@teste.com', password:'123456')

    visit root_path
    click_on 'Log in'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Log in'

    expect(page).to have_content('Signed in successfully')
  end
  scenario "and he confirm auth of user" do
    user = create(:user, email:'teste@teste.com', password:'123456', adm: true)

    visit root_path
    click_on 'Log in'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('BEM VINDO AO SISTEMA ADMINISTRADOR')
  end

end