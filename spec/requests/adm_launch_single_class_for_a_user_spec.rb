require 'rails_helper'

describe 'adm launch single class for a user' do
  it 'addition single class in next payment' do
    registration = create(:registration, name:'JOAO')
    registration.generate_anual_payments
    single_class = create(:single_class)
    ClientsClass.create!(registration: registration, single_class: single_class)

    expect(registration.pay)
  end
end