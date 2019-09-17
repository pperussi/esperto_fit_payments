require 'rails_helper'

describe 'api search registration dependencies' do

  it 'api search plan' do
    plan = Plan.create!(name: 'Executivo', value: 70)

    get 'http://localhost:3000/api/v1/plans', params: { plan:{ name: 'Executivo', value: 40}}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include plan.name
    expect(response.body).to include plan.value
    expect(response.status).to eq 201
  end

  it 'api search unity' do
    unity = Unity.create!(name: 'Paulista')

    get 'http://localhost:3000/api/v1/unity', params: { unity:{ name: 'Paulista'}}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include unity.name
    expect(response.status).to eq 201
  end

  it 'api search pay_method' do
    PayMethod.create!(name: 'Boleto')

    get 'http://localhost:3000/api/v1/pay_method', params: { pay_method:{ name: 'Boleto'}}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include 'Boleto'
    expect(response.status).to eq 201
  end

  it 'api search all pay_methods' do
    pay_method = PayMethod.create!(name: 'Boleto')
    other_pay_method = PayMethod.create!(name: 'Cartāo')

    get 'http://localhost:3000/api/v1/pay_methods'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include pay_method.name
    expect(response.body).to include other_pay_method.name
    expect(response.status).to eq 201
  end
end