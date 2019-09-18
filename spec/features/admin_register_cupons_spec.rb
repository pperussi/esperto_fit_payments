require 'rails_helper'
feature 'Admin register Cupons in promotion' do
  scenario 'successfully' do
    administrator = create(:user,admin: true)
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', cupom_number: 10)

    visit promotions_path


      fill_in 'email', with: administrator.email
      fill_in 'password', with: administrator.password
      click_on 'Log in'


    click_on carnaval.name
    click_on 'Gerar cupons'
    expect(current_path).to eq promotion_path(carnaval)
    expect(page).to have_css('li',text:'CARNA0002')
  end

  scenario 'User not admin not create cupons' do
    user = create(:user)
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', cupom_number: 10)

    visit promotions_path


      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_on 'Log in'
    

    click_on carnaval.name

    expect(current_path).to eq promotion_path(carnaval)
    expect(page).not_to have_button('Gerar cupons')
  end
end
