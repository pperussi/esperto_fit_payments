require 'rails_helper'

feature 'Admin register promo' do
  scenario 'successfully' do
    administrator = create(:user, admin: true)
    visit promotions_path

    within('form') do
      fill_in 'Email', with: administrator.email 
      fill_in 'Password', with: administrator.password
      click_on 'Log in'
    end

    click_on 'Criar Promoçāo'

    fill_in 'Nome', with: 'Carnaval'
    fill_in 'Descriçāo', with: 'Entre no clima do Carnaval'
    fill_in 'Porcentegem do desconto', with: 15
    fill_in 'Valor máximo', with: 20
    fill_in 'Número de cupons', with: 70
    fill_in 'Código da promoçāo',with: 'CARNA'
    fill_in 'Início da promoçāo', with: '15/01/2020'
    fill_in 'Fim da promoçāo', with: '30/03/2020'
    click_on 'Enviar'

    expect(page).to have_content('Carnaval')
    expect(page).to have_content('Entre no clima do Carnaval')
    expect(page).to have_content(15)
    expect(page).to have_content(20)
    expect(page).to have_content(70)
    expect(page).to have_content('15/01/2020')
    expect(page).to have_content('30/03/2020')
  end

  scenario 'successfully' do
    administrator = create(:user, admin: true)
    
    visit promotions_path

    within('form') do
      fill_in 'Email', with: administrator.email 
      fill_in 'Password', with: administrator.password
      click_on 'Log in'
    end

    click_on 'Criar Promoçāo'

    fill_in 'Nome', with: ''
    fill_in 'Descriçāo', with: ''
    fill_in 'Porcentegem do desconto', with: 15
    fill_in 'Valor máximo', with: 20
    fill_in 'Número de cupons', with: 70
    fill_in 'Código da promoçāo',with: ''
    fill_in 'Início da promoçāo', with: ''
    fill_in 'Fim da promoçāo', with: ''
    click_on 'Enviar'

    # expect(current_path).to eq new_promotion_path
    expect(page).to have_content('Nāo foi possível salvar a promoçāo')
  end
  scenario 'fail create promotions user' do 
    administrator = create(:user)

    visit promotions_path

    expect(page).not_to have_link('Criar Promoçāo')
    expect(current_path).to eq  new_user_session_path 
  end

  scenario 'fail create promotions user access url' do 
    administrator = create(:user)


    
    visit new_promotion_path

    expect(page).not_to have_link('Criar Promoçāo')
    expect(current_path).to eq new_user_session_path 
  end
end