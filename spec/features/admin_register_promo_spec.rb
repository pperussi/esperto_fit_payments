require 'rails_helper'

feature 'Admin register promo' do
  scenario 'successfully' do
    administrator = create(:user, admin: true)
    login_as(administrator)
    visit promotions_path
    click_on 'Criar Promoçāo'
    fill_in 'Nome', with: 'Carnaval'
    fill_in 'Descriçāo', with: 'Entre no clima do Carnaval'
    fill_in 'Porcentagem de Desconto', with: 15
    fill_in 'Valor Máximo de Desconto', with: 20
    fill_in 'Número de Cupons', with: 70
    fill_in 'Código da Promoçāo', with: 'CARNA'
    fill_in 'Início da Promoção', with: '15/01/2020'
    fill_in 'Fim da Promoção', with: '30/03/2020'
    click_on 'Criar'

    expect(page).to have_content('Carnaval')
    expect(page).to have_content('Entre no clima do Carnaval')
    expect(page).to have_content(15)
    expect(page).to have_content(20)
    expect(page).to have_content(70)
    expect(page).to have_content('15/01/2020')
    expect(page).to have_content('30/03/2020')
  end

  scenario ' not register promotions in the past ' do
    administrator = create(:user, admin: true)
    login_as(administrator)
    visit promotions_path

    click_on 'Criar Promoçāo'

    fill_in 'Nome', with: 'Carnaval'
    fill_in 'Descriçāo', with: 'Entre no clima do Carnaval'
    fill_in 'Porcentagem de Desconto', with: 15
    fill_in 'Valor Máximo de Desconto', with: 20
    fill_in 'Número de Cupons', with: 70
    fill_in 'Código da Promoçāo',with: 'CARNA'
    fill_in 'Início da Promoção', with: '15/01/2000'
    fill_in 'Fim da Promoção', with: '30/03/2020'
    click_on 'Criar'

    expect(page).to have_content("can't be in the past")
  end

  scenario 'not register blank promotions' do
    administrator = create(:user, admin: true)

    login_as(administrator)
    visit promotions_path

    click_on 'Criar Promoçāo'
    fill_in 'Nome', with: ''
    fill_in 'Descriçāo', with: ''
    fill_in 'Porcentagem de Desconto', with: 15
    fill_in 'Valor Máximo de Desconto', with: 20
    fill_in 'Número de Cupons', with: 70
    fill_in 'Código da Promoçāo', with: ''
    fill_in 'Início da Promoção', with: ''
    fill_in 'Fim da Promoção', with: ''
    click_on 'Criar'

    expect(page).to have_content('Nāo foi possível salvar a promoçāo')
  end
  scenario 'fail create promotions user' do
    administrator = create(:user)

    visit promotions_path

    expect(page).not_to have_link('Criar Promoçāo')
    expect(current_path).to eq new_user_session_path
  end

  scenario 'fail create promotions user access url' do
    administrator = create(:user)

    visit new_promotion_path

    expect(page).not_to have_link('Criar Promoçāo')
    expect(current_path).to eq new_user_session_path
  end
end
