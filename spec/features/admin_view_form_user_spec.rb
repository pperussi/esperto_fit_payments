require 'rails_helper'

describe 'admin can create payment method' do
  scenario 'successfuly' do
    user = create(:user, email: 'teste@teste.com', password:'123456', admin: true)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Metodo de pagamento', with: 'Boleto'
    click_on 'Cadastrar'

    expect(page).to have_content('Cadastrado com sucesso')
    expect(PayMethod.count).to eq 1
    expect(PayMethod.first.name).to eq 'Boleto'
  end
  
  scenario 'and he can view all payment methods' do
    user = create(:user, email: 'teste@teste.com', password:'123456', admin: true)
    create(:pay_method, name: 'Boleto')
    create(:pay_method, name: 'Credito')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Nova Matrícula'
    select 'Boleto', from: 'Metodo de pagamento'

    expect(page).to have_content('Boleto')
  end

  scenario 'cant be duplicate' do
    user = create(:user, email: 'teste@teste.com', password:'123456', admin: true)
    create(:pay_method, name: 'Boleto')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Metodo de pagamento', with: 'Boleto'
    click_on 'Cadastrar'

    expect(page).to have_content('Name já está em uso')
    expect(PayMethod.count).not_to eq 2
  end
  
  scenario 'cant be blank' do 
    user = create(:user, email: 'teste@teste.com', password:'123456', admin: true)
    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Metodo de pagamento', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content("Name não pode ficar em branco")
  end
end