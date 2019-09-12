require 'rails_helper'
feature 'adm launch single class for a user' do
  scenario 'successfuly' do
    user = create(:user, email:'teste@teste.com', password:'123456', admin: true)
    registration = create(:registration,name:'Joao')
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
    click_on 'Lancar'

    expect(page).to have_content('Joao')
    expect(page).to have_content('Zumba')
    expect(page).to have_content('Paulista')
    expect(page).to have_content(90.0)
  end

  scenario 'addition single class in next payment' do
    #pay_method = PayMethod.create!(name:'Debito')
    #plan = Plan.create!(name:'novo',value: 400)
    #unity= Unity.create!(name:'LAPA')
    #user = Registration.create!(name:'Paula',cpf:'121212',unity: unity,plan: plan,pay_method: pay_method )
    #user = create(:user, admin: true)
    #unity = create(:unity, name:'Paulista')
    #plan = create(:plan, name:'Executivo')
    #create(:pay_method, name:'Boleto')
  end
end
