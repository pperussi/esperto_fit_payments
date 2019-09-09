require 'rails_helper'

describe 'Adm can search clients' do
  scenario 'successfully' do
    user = create(:user, email:'teste@teste.com', password:'123456', adm: true)
    Client.create!(name:'Joao')
    Client.create!(name:'Joaozinho')
    Client.create!(name:'other_teste')


    login_as(user, scope: :user)
    visit root_path
    click_on 'Lancar aula avulsa para aluno'

    expect(page).not_to have_content('Joao')
    expect(page).not_to have_content('Joaozinho')
    expect(page).not_to have_content('other_teste')

  end
end