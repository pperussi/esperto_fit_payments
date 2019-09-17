require 'rails_helper'

feature 'admin can create payment method' do
  scenario 'successfuly' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)

    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Nome', with: 'Boleto'
    fill_in 'Taxa de Cobrança', with: 0
    fill_in 'Limite de Dias', with: 15

    click_on 'Criar'

    expect(page).to have_content('Cadastrado com sucesso')
    expect(PayMethod.count).to eq 1
    expect(PayMethod.first.name).to eq 'Boleto'
    expect(PayMethod.first.tax).to eq 0
    expect(PayMethod.first.limit_days).to eq 15
  end

  scenario 'and he can view all payment methods' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    create(:pay_method, name: 'Boleto', tax: 0, limit_days: 15)
    create(:pay_method, name: 'Credito', tax: 5, limit_days: 4)

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
    fill_in 'Taxa de Cobrança', with: 0
    fill_in 'Limite de Dias', with: 15
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
    fill_in 'Taxa de Cobrança', with: ''
    click_on 'Criar'

    expect(page).to have_content("Nome não pode ficar em branco")
  end
end
