require 'rails_helper'

feature 'admin can create payment method' do
  scenario 'successfuly' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)

    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Nome', with: 'Boleto'
    click_on 'Criar'

    expect(page).to have_content('Cadastrado com sucesso')
    expect(PayMethod.count).to eq 1
    expect(PayMethod.first.name).to eq 'Boleto'

  end

  scenario 'and he can view all payment methods' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    create(:pay_method, name: 'Boleto')
    create(:pay_method, name: 'Credito')

    login_as(user, scope: :user)
    visit pay_methods_path

    expect(page).to have_content('Boleto')
    expect(page).to have_content('Credito')
  end

  scenario 'cant be duplicate' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    create(:pay_method, name: 'Boleto')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Nome', with: 'Boleto'
    click_on 'Criar'

    expect(page).to have_content('Nome já está em uso')
    expect(PayMethod.count).not_to eq 2
  end

  scenario 'cant be blank' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Nome', with: ''
    click_on 'Criar'

    expect(page).to have_content("Nome não pode ficar em branco")
  end
end
