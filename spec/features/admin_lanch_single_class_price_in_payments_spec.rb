require 'rails_helper'

feature 'admin launch single class price in a payment' do
  scenario 'successfuly' do
    user = create(:user, email: 'teste@teste.com', password: '123456',
                  admin: true)
    registration = create(:registration, name: 'Joao')
    registration.generate_anual_payments

    login_as(user, scope: :user)
    visit root_path

    click_on "Matrículas"
    fill_in 'Pesquisar aluno', with: 'Joao'

    click_on 'Buscar'
    click_on 'Joao'

    fill_in 'Nome da aula', with: 'Zumba'
    fill_in 'Unidade', with: 'Paulista'
    fill_in 'Valor', with: 90.00
    click_on 'Lançar'

    click_on 'Voltar'

    fill_in 'Procurar CPF:', with: registration.cpf
    click_on 'Procurar'

    expect(page).to have_content('Joao')
    expect(page).to have_content(123456)
    expect(page).to have_content(130.00)
    expect(page).to have_content("Aula de Zumba adicionada - Valor: 90")
  end
end
