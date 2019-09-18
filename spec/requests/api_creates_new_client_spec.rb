require 'rails_helper'

describe 'api creates new client' do
  it 'successfully' do
    unity = Unity.create!(name: 'Paulista')
    pay_method = create(:pay_method, name: 'Cheque')
    plan = Plan.create!(name: 'Executivo', value: 70)
    registration = Registration.create!(name: 'teste', cpf: '123', \
                                        unity_id: 1, plan_id: 1, \
                                        pay_method_id: 1)
    payment = registration.payments.create!(value: 50, registration_id: 1,\
                                           pay_method_id: 1,\
                                           dt_venc: '2019-09-14 18:20:44')

    post 'http://localhost:3000/api/v1/registrations', params: { registration:{ plan_id: plan.id, unity_id: unity.id, name:'diogo', cpf: '1323', pay_method_id: pay_method.id}}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include '1323'
    expect(response.status).to eq 201
  end

  it 'failed' do
    post 'http://localhost:3000/api/v1/registrations', params: { registration:{ plan_id: 1, unity_id: 1, name:'diogo', cpf: '1323', pay_method_id: 1}}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include 'Dados inválidos'
    expect(response.status).to eq 404
  end

  it 'api creates new plan' do
    post 'http://localhost:3000/api/v1/plans', params: { plan:{ name: 'Executivo', value: 40}}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include 'Executivo'
    expect(response.status).to eq 201
  end

  it 'api creates new unity' do
    post 'http://localhost:3000/api/v1/unity', params: { unity: { name: 'Paulista' }}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include 'Paulista'
    expect(response.status).to eq 201
  end

  it 'api creates new pay_method' do
    post 'http://localhost:3000/api/v1/pay_methods', params: { pay_method: { name: 'Boleto', tax: 1, limit_days: 15}}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.body).to include 'Boleto'
    expect(response.status).to eq 201
  end
end