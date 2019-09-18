require 'rails_helper'

feature 'admin launch single class for a user' do
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
    expect(PaymentMailer).to receive(:invoice_single_class).and_call_original
    click_on 'Lançar'

    expect(page).to have_content('Joao')
    expect(page).to have_content('Zumba')
    expect(page).to have_content('Paulista')
    expect(page).to have_content(90.0)
  end

  scenario 'other mailer test' do
    user = create(:user, email: 'teste@teste.com', password: '123456',
                  admin: true)
    registration = create(:registration, name: 'Joao')
    registration.generate_anual_payments
    mailer_spy = class_spy(PaymentMailer)
    stub_const('PaymentMailer', mailer_spy)
    mailer = double('PaymentMailer')
    allow(mailer_spy).to receive(:invoice_single_class).and_return(mailer)
    allow(mailer).to receive(:deliver_now)

    # simplificado
    # mailer = double('PaymentMailer')
    # allow(PaymentMailer).to receive(:invoice_single_class).and_return(mailer)
    # allow(mailer).to receive(:deliver_now)

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

    expect(page).to have_content('Joao')
    expect(page).to have_content('Zumba')
    expect(page).to have_content('Paulista')
    expect(page).to have_content(90.0)
    expect(PaymentMailer).to have_received(:invoice_single_class)
  end

  scenario 'and can not be blank' do
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

    fill_in 'Nome da aula', with: ''
    fill_in 'Unidade', with: ''
    fill_in 'Valor', with: 00
    click_on 'Lançar'

    expect(page).to have_content('Não foi possível salvar a nova Aula')
  end
end
