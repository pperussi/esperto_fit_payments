require 'rails_helper'
describe 'adm launch single class for a user' do
  scenario 'successfuly' do

    user = create(:user, email:'teste@teste.com', password:'123456', adm: true)
    client = Cleint.create(name:'Joaozinho da Silva')
    sclass = SingleClass.create(name:'Zumba', unit: 'Paulista', price:90.00)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lancar aula avulsa para aluno'
    fill_in 'Pesquisar aluno', with: 'Joaozinho da Silva'
    click_on 'Joazinho da silva'
    fill_in 'Nome da aula', with: 'Zumba'
    fill_in 'Unidade', with: 'Paulista'
    fill_in 'Valor', with: 90.00 
    click_on 'Lancar'

    expect(page).to have_content('Joaozinho da Silva')
    expect(page).to have_content('Zumba')
    expect(page).to have_content('Paulista')
    expect(page).to have_content('90.00')
  end
end
