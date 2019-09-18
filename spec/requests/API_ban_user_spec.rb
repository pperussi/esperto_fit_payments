require 'rails_helper'
describe 'API ban user' do
  
    it 'successfully' do
        registration = create(:registration, name: 'JOAO')
        registration.generate_anual_payments
     
        post  "/api/v1/payments/ban", params: { cpf: '123456'}
        
        json_payments = JSON.parse(response.body, symbolize_names: true)
        
        expect(response.status).to eq 200
        expect(json_payments[:msg]).to include registration.cpf
        expect(registration.payments[0].status). to eq 'canceled'
        expect(registration.payments[11].status). to eq 'canceled'
    end

    it 'cpf doesnt exist' do
        post  '/api/v1/payments/ban', params: { cpf: '0'}
        expect(response).to have_http_status(:not_found)
    end

end