require 'rails_helper'

feature 'admin can create payment method' do
  scenario 'successfuly' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Metodo de pagamento', with: 'Boleto'
    fill_in 'Taxa cobrada pela empresa', with: 0 #DE ACORDO COM O PROCON procon.pr.gov.br/modules/conteudo/conteudo.php?conteudo=297 BOLETO N PODE TER TAXA!
    fill_in 'Limite de dias para a cobrança', with: 15

    click_on 'Cadastrar'

    expect(page).to have_content('Cadastrado com sucesso')
    expect(PayMethod.count).to eq 1
    expect(PayMethod.first.name).to eq 'Boleto'
    expect(PayMethod.first.tax).to eq 0
    expect(PayMethod.first.limit_days).to eq 15
  end
  
  scenario 'and he can view all payment methods' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    create(:pay_method, name: 'Boleto')
    create(:pay_method, name: 'Credito')

    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_content('Boleto')
    expect(page).to have_content('Credito')
  end

  scenario 'cant be duplicate' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
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
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    login_as(user, scope: :user)

    visit root_path
    click_on 'Criar metodo de pagamento'
    fill_in 'Metodo de pagamento', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content("Name não pode ficar em branco")
  end
end