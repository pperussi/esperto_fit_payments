require 'rails_helper'

feature 'Change status' do
  scenario 'successfully' do
    user = create(:user, admin: true)
    registration = create(:registration,name:'Zé')

    login_as user
    visit root_path
    click_on 'Matrículas'

    within('tr#1') do
      click_on 'Mostrar'
    end

    within('tr#12') do
      click_on 'Pagar'
    end

    expect(page).to have_content('paid')

  end
end