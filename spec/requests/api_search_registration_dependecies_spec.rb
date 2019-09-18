require 'rails_helper'

describe 'api search registration dependencies' do

  it 'api lists all plans' do
    plan = Plan.create!(name: 'Executivo', value: 70)

    get 'http://localhost:3000/api/v1/plans/'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include plan.name
    expect(response.status).to eq 200
  end

  it 'api lists one plans' do
#, params: { plan: { name: 'Executivo'}}
  end

  it 'api search all unities' do
    unity = Unity.create!(name: 'Paulista')

    get 'http://localhost:3000/api/v1/unity'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include unity.name
    expect(response.status).to eq 200
  end

  it 'api searches one unity' do
    #, params: { unity:{ name: 'Paulista'}}
  end

  it 'api search one pay_method' do
    pay_method = create(:pay_method, name: 'Boleto')


    get 'http://localhost:3000/api/v1/pay_methods', params: { name: 'Boleto'}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include 'Boleto'
    expect(response.status).to eq 200
  end

  it 'api searches all pay methods' do
    pay_method = create(:pay_method, name: 'Boleto')
    pay_method = create(:pay_method, name: 'Cartão')


    get 'http://localhost:3000/api/v1/pay_methods'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include 'Boleto'
    expect(response.body).to include 'Cartão'
    expect(response.status).to eq 200
  end

end