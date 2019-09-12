require 'rails_helper'

describe 'adm launch single class for a user' do
  it 'addition single class in next payment' do
    registration = create(:registration, name:'JOAO')
    registration.generate_anual_payments
    single_class = create(:single_class)
    ClientsClass.create!(registration: registration, single_class: single_class)
    single_class.class_debit(registration)
    expect(registration.payments.find_by(status:'pending').value).to eq 90
  end
end