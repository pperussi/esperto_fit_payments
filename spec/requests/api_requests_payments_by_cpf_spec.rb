require 'rails_helper'

describe 'Api requests all payments details for one client' do
    it 'successfully' do
        unity = Unity.create!(name: 'Paulista')
        pay_method = PayMethod.create!(name: 'Boleto')
        plan = Plan.create!(name: 'Executivo', value: 70)
        registration = Registration.create!(name: 'teste', cpf: "222", \
                                            unity_id: 1, plan_id: 1, \
                                            pay_method_id: 1)
        payment = registration.payments.create!(value: 50, registration_id: 1,\
                                               pay_method_id: 1,\
                                               dt_venc: '2019-09-14 18:20:44')

        get "/api/v1/registrations/payments", params: {cpf: '222'}
        json_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 200
        expect(response.body).to include 'registration_id'
        expect(response.body).to include payment.status
        expect(response.body).to include 'status'
        expect(response.body).to include 'value'
    end

    it 'search by invalid cpf' do
        get "/api/v1/registrations/payments/", params: { cpf: '100'}
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 404
        
    end

end