require 'rails_helper'

feature 'admin edit registration' do
  scenario 'successfully' do
    user = create(:user, admin: true)
    registration = create(:registration,name:'Zé')

    login_as user
    visit root_path

    click_on 'Matrículas'
    click_on 'Editar'

    fill_in 'Nome', with: 'Fulano de tal'
    fill_in 'CPF', with: '345678098'
    
    click_on 'Enviar'

    expect(page).to have_css('h2', text: 'Fulano de tal')
    expect(page).to have_css('p', text: '345678098')
  end

  scenario 'empty' do
    user = create(:user, admin: true)
    registration = create(:registration,name:'Zé')

    login_as user
    visit root_path

    click_on 'Matrículas'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    
    click_on 'Enviar'

    expect(page).to have_content('Nao foi possivel salvar matricula')
  end
end