require 'rails_helper'

RSpec.describe Payment, type: :model do
  it 'pay methods with tax' do
    pay_method = create(:pay_method, name: 'Cartāo', tax: 5)
    registration = create(:registration, name: 'José', pay_method: pay_method)
    registration.generate_anual_payments

    expect(registration.payments[0].value).to eq 42
  end
 end
