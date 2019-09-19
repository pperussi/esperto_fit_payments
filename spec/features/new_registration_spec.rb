require 'rails_helper'

feature 'new registration'do
  scenario 'view form' do
    user = create(:user, admin: true)
    unity = create(:unity, name: 'Paulista')
    plan = create(:plan, name: 'Executivo')
    create(:pay_method, name: 'Boleto')

    login_as user
    visit root_path
    click_on 'Nova Matrícula'
    fill_in 'Nome', with: 'Fulano de tal'
    fill_in 'CPF', with: '345678098'
    select 'Paulista', from: 'Unidade'
    select 'Executivo', from: 'Plano'
    select 'Boleto', from: 'Metodo de pagamento'
    click_on 'Enviar'

    expect(page).to have_css('h4', text: 'Fulano de tal')
    expect(page).to have_css('p', text: '345678098')
    expect(page).to have_css('p', text: 'Paulista')
    expect(page).to have_css('p', text: 'Executivo')
  end

  scenario 'empty fields' do
    user = create(:user, admin: true)

    login_as user
    visit root_path
    click_on 'Nova Matrícula'
    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nao foi possivel salvar matricula')
  end

  scenario 'generate payments' do
    user = create(:user, admin: true)
    unity = create(:unity, name: 'Paulista')
    plan = create(:plan, name: 'Executivo', value: 40)
    create(:pay_method, name: 'Boleto')

    login_as user
    visit root_path
    click_on 'Nova Matrícula'
    fill_in 'Nome', with: 'Fulano de tal'
    fill_in 'CPF', with: '345678098'
    select 'Paulista', from: 'Unidade'
    select 'Executivo', from: 'Plano'
    select 'Boleto', from: 'Metodo de pagamento'
    click_on 'Enviar'

    expect(page).to have_css('h4', text: 'Fulano de tal')
    expect(page).to have_css('p', text: '345678098')
    expect(page).to have_css('p', text: 'Paulista')
    expect(page).to have_css('p', text: 'Executivo')
    expect(page).to have_content('Pagamento 1')
    expect(page).to have_content(plan.name)
    expect(page).to have_content(plan.value)
  end

  scenario 'must be admin to create registration' do
    visit new_registration_path

    expect(current_path).to eq new_user_session_path
  end

  scenario 'can\'t be duplicate registrations ' do
    user = create(:user, admin: true)
    unity = create(:unity, name: 'Barra funda')
    plan = create(:plan, name: 'Master', value: 40)
    pay_method = create(:pay_method, name: 'Boleto')
    create(:registration, cpf: '123456789', unity: unity, plan: plan, pay_method: pay_method)

    login_as user
    visit root_path
    click_on 'Nova Matrícula'
    fill_in 'Nome', with: 'Fulano de tal'
    fill_in 'CPF', with: '123456789'
    select unity.name, from: 'Unidade'
    select plan.name, from: 'Plano'
    select pay_method.name, from: 'Metodo de pagamento'
    click_on 'Enviar'

    expect(page).to have_content('Nao foi possivel salvar matricula')
  end
end
