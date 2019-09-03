require 'rails_helper'

feature 'new registration'do
  scenario 'successfully' do
    user = create(:user)
    
    visit root_path

    click_on 'Entrar'
    fill_in 'Email', with: 'admin@espertofit.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    expect(page).to have_link('Nova Matrícula')
  end 
end