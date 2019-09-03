require 'rails_helper'

feature 'new registration'do
  scenario 'successfully' do
    user = create(:user)
    
    login_as(user, scope: :user)

    visit root_path
 
    click_on 'Nova Matrícula'

    fill_in 'Nome', with: 'Fulano de tal'
    fill_in 'CPF', with: '345678098'
    fill_in 'Unidade', with: 'Paulista'
    fill_in 'Plano', with: 'Master'
    click_on 'Enviar'

    expect(page).to have_css('h2', 'Fulano de tal')
    expect(page).to have_css('p', '345678098')
    expect(page).to have_css('p', 'Paulista')
    expect(page).to have_css('p', 'Master')
  end 
end