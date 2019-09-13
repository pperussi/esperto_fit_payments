require 'rails_helper'

feature 'Adm can search clients' do
  scenario 'successfully' do
    user = create(:user, admin: true)
    registration = create(:registration, name:'Joao')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Matrículas'
    fill_in 'Pesquisar aluno', with: 'Joao'
    click_on 'Buscar'

    expect(page).to have_content('Joao')
  end
end