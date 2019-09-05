require 'rails_helper'

describe 'admin can create payment method' do
  scenario 'successfuly' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)

    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Metodo de pagamento', with: 'Boleto'
    click_on 'Cadastrar'

    expect(page).to have_content('Cadastrado com sucesso')
    expect(Payment.count).to eq 1
    expect(Payment.first.pay_method).to eq 'Boleto'

  end
  
  scenario 'and he can view all payment methods' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    create(:payment, pay_method: 'Boleto')
    create(:payment, pay_method: 'Credito')

    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_content('Boleto')
    expect(page).to have_content('Credito')
  end

  scenario 'cant be duplicate' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    create(:payment, pay_method: 'Boleto')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Metodo de pagamento', with: 'Boleto'
    click_on 'Cadastrar'

    expect(page).to have_content('Metodo de pagamento já está em uso')
    expect(Payment.count).not_to eq 2
  end
  
  scenario 'cant be blank' do 
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Metodo de pagamento', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content("Metodo de pagamento não pode ficar em branco")
  end
end