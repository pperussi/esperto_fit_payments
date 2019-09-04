require 'rails_helper'

feature 'new registration'do
  scenario 'view form' do
    unity = create(:unity, name:'Paulista')
    plan = create(:plan, name:'Executivo')
    #client = Client.create(name:'Zé',cpf:'1234567',unity:unity,plan:plan)

    #user = create(:user)
    #login_as(user, scope: :user)

    visit root_path
 
    click_on 'Nova Matrícula'

    fill_in 'Nome', with: 'Fulano de tal'
    fill_in 'CPF', with: '345678098'
    select 'Paulista', from: 'Unidade'
    select 'Executivo', from: 'Plano'
    click_on 'Enviar'

    expect(page).to have_css('h2', text: 'Fulano de tal')
    expect(page).to have_css('p', text: '345678098')
    expect(page).to have_css('p', text: 'Paulista')
    expect(page).to have_css('p', text: 'Executivo')
  end
  
  scenario 'empty fields' do
    visit root_path
 
    click_on 'Nova Matrícula'

    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
  
    click_on 'Enviar'

    expect(page).to have_content('Nao foi possivel salvar matricula')
  end

  scenario 'generate payments' do
    unity = create(:unity, name:'Paulista')
    plan = create(:plan, name:'Executivo', value: 40)

    visit root_path
 
    click_on 'Nova Matrícula'

    fill_in 'Nome', with: 'Fulano de tal'
    fill_in 'CPF', with: '345678098'
    select 'Paulista', from: 'Unidade'
    select 'Executivo', from: 'Plano'
    click_on 'Enviar'

    expect(page).to have_css('h2', text: 'Fulano de tal')
    expect(page).to have_css('p', text: '345678098')
    expect(page).to have_css('p', text: 'Paulista')
    expect(page).to have_css('p', text: 'Executivo')
    expect(page).to have_content('Pagamento 1')
    expect(page).to have_content(plan.name)

    expect(page).to have_content(payment.value)
  end
end