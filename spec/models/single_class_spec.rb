require 'rails_helper'

RSpec.describe SingleClass, type: :model do
 it 'launch single class in next pending payment' do
  registration = create(:registration, name: 'Henrique')
  registration.generate_anual_payments
  single_class = create(:single_class, name: 'BOXE')
  ClientsClass.create!(registration: registration, single_class: single_class)
  single_class.class_debit(registration)

  expect(registration.payments[0].status).to eq 'closed'
  expect(registration.payments[0].value).to eq 40
  expect(registration.payments[1].value).to eq 90
  expect(registration.payments.find_by(status: 'pending').value).to eq 90
 end
 it 'addition tax in single class price' do
  pay_method = create(:pay_method, name: 'Cartāo', tax: 5)
  registration = create(:registration, name: 'José', pay_method: pay_method)
  registration.generate_anual_payments
  single_class = create(:single_class, name: 'Zumba', price: 80 )

  ClientsClass.create!(registration: registration, single_class: single_class)

  single_class.class_debit(registration)
  expect(registration.payments.find_by(status: 'pending').value).to eq 126
end
end
