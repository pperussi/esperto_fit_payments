require 'rails_helper'

feature 'user navigation' do
  scenario 'cant view administrator page' do
    user = create(:user, email: 'teste@teste.com.br', password: '123456')
    
    login_as(user)
    visit root_path

    expect(page).not_to have_content('BEM VINDO AO SISTEMA ADMINISTRADOR')
  end

  scenario 'user is redirected to root_path if not admin' do
    user = create(:user, email: 'teste@teste.com.br', password: '123456')
    
    login_as(user)
    visit administrator_index_path

    expect(current_path).to eq root_path
  end

  scenario 'user is redirected to root_path if not admin' do
    user = create(:user, email: 'teste@teste.com.br', password: '123456')
    
    login_as(user)
    visit new_pay_method_path

    expect(current_path).to eq root_path
  end

  scenario 'user not authenticated is redirected to root_path' do
    visit administrator_index_path

    expect(current_path).to eq new_user_session_path
  end

  scenario 'user not authenticated cant view payment page' do
    visit new_pay_method_path

    expect(current_path).to eq new_user_session_path
  end
end
