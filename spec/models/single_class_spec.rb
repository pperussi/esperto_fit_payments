require 'rails_helper'

RSpec.describe SingleClass, type: :model do
  it 'and add price in the next payment' do
    registration = create(:registration, name: 'JOAO')
    registration.generate_anual_payments
    single_class = create(:single_class)

    ClientsClass.create!(registration: registration, single_class: single_class)

    single_class.class_debit(registration)

    expect(registration.payments.find_by(status: 'pending').value).to eq 90
  end

  it 'addition single class in next payment' do
    registration = create(:registration, name: 'JOAO')
    registration.generate_anual_payments
    single_class = create(:single_class)
    another_single_class = create(:single_class, name: 'Zumba', price: 80 )

    ClientsClass.create(registration: registration, single_class: single_class)
    ClientsClass.create(registration: registration, single_class: another_single_class)

    single_class.class_debit(registration)
    another_single_class.class_debit(registration)

    expect(registration.payments.find_by(status: 'pending').value).to eq 170
  end

  it 'launch single class in next pending payment' do
    registration = create(:registration, name: 'Henrique')
    registration.generate_anual_payments
    single_class = create(:single_class, name: 'BOXE', date:'2019-12-16' )

    ClientsClass.create!(registration: registration, single_class: single_class)
    single_class.class_debit(registration)
    expect(registration.payments[0].status).to eq 'closed'
    expect(registration.payments[0].value).to eq 40
    expect(registration.payments[1].value).to eq 90
    expect(registration.payments.find_by(status: 'pending').value).to eq 90
  end

  it 'launch another single class in next pending payment' do
    pay_method = create(:pay_method, name: 'Cartāo', tax: 5, limit_days: 1)
    registration = create(:registration, name: 'Henrique', pay_method: pay_method)
    registration.generate_anual_payments
    single_class = create(:single_class, name: 'BOXE', date:Time.zone.now.to_date + 1.month)
    ClientsClass.create!(registration: registration, single_class: single_class)

    single_class.class_debit(registration)

    expect(registration.payments[0].status).to eq 'closed'
    expect(registration.payments[0].value).to eq 42
    expect(registration.payments[1].value).to eq 94.5
    expect(registration.payments.find_by(status: 'pending').value).to eq 94.5
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
