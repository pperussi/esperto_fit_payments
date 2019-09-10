require 'rails_helper'

describe 'Adm can search clients' do
  scenario 'successfully' do
    user = create(:user, admin: true)
    registration = create(:registration,name:'Joao')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lancar aula avulsa para aluno'

    expect(page).not_to have_content('Joao')
    expect(page).not_to have_content('Joaozinho')
    expect(page).not_to have_content('other_teste')
  end
end