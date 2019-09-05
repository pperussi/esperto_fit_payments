require 'rails_helper'
describe 'adm launch single class for a user' do
  scenario 'successfuly' do
#Testar search, models e alterar views.
    user = create(:user, email:'teste@teste.com', password:'123456', adm: true)
    client = Client.create!(name:'Joaozinho da Silva')
    sclass = SingleClass.create!(name:'Zumba', unit: 'Paulista', price:90.00, clients_id: client)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lancar aula avulsa para aluno'
    fill_in 'Pesquisar aluno', with: 'Joaozinho da Silva'
    click_on 'Buscar'
    click_on 'Joaozinho da Silva'
    fill_in 'Nome da aula', with: 'Zumba'
    fill_in 'Unidade', with: 'Paulista'
    fill_in 'Valor', with: 90.00 
    click_on 'Lancar'

    expect(page).to have_content('Joaozinho da Silva')
    expect(page).to have_content('Zumba')
    expect(page).to have_content('Paulista')
    expect(page).to have_content(90.0)
  end
end
