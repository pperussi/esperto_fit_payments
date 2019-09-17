require 'rails_helper'

describe 'Search all pay methods' do
  it 'succesfully' do
    pay_method = create(:pay_method)
    pay_method_two = create(:pay_method, name: 'Cartão de Crédito')
    pay_method_three = create(:pay_method, name: 'Bitcoin')

    get '/api/v1/pay_methods'

    expect(response.status).to eq 200
    expect(response.body).to include 'Boleto'
    expect(response.body).to include 'Cartão de Crédito'
    expect(response.body).to include 'Bitcoin'
  end
end
