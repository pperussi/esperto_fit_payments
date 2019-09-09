require 'rails_helper'
describe 'adm launch single class for a user' do
  scenario 'successfuly' do
#Testar search, models e alterar views.
    user = create(:user, email:'teste@teste.com', password:'123456', adm: true)
    client = Client.create!(name:'Joao')
    sclass = SingleClass.create!(name:'Zumba', unit: 'Paulista', price:90.00, clients_id: client)
    ClientsClass.create!(client: client, single_class: sclass)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lancar aula avulsa para aluno'
    fill_in 'Pesquisar aluno', with: 'Joao'
    click_on 'Buscar'
    click_on 'Joao'
    fill_in 'Nome da aula', with: 'Zumba'
    fill_in 'Unidade', with: 'Paulista'
    fill_in 'Valor', with: 90.00 
    click_on 'Lancar'
    expect(page).to have_content('Joao')
    expect(page).to have_content('Zumba')
    expect(page).to have_content('Paulista')
    expect(page).to have_content(90.0)
  end

  describe '' do

  end
end
