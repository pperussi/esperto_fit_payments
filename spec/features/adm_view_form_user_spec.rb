require 'rails_helper'

describe 'adm can create payment method' do
  scenario 'successfuly' do
    user = create(:user, email:'teste@teste.com', password:'123456', adm: true)

    visit root_path
    click_on 'Log in'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Log in'
    click_on 'Criar metodo de pagamento'
    fill_in 'Metodo de pagamento', with: 'Boleto'
    click_on 'Cadastrar'

    expect(page).to have_content('Cadastrado com sucesso')
  end
end