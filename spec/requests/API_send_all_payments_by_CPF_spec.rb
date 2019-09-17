require 'rails_helper'
describe 'API show all payments' do
    it 'successfully' do
        registration = create(:registration, name: 'JOAO')
        registration.generate_anual_payments
     
        get  "/api/v1/payments/#{registration.cpf}"
        json_payments = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 200
        expect(json_payments[:cpf]).to include registration.cpf
        expect(json_payments[:payments][0][:dt_venc].to_date).to eq registration.payments[0].dt_venc
        expect(json_payments[:payments][0][:value]).to eq registration.payments[0].value
        expect(json_payments[:payments][5][:dt_venc].to_date).to eq registration.payments[5].dt_venc
    end
    it 'cpf doesnt exist' do
        get  '/api/v1/payments/0'
        expect(response).to have_http_status(:not_found)
    end
end
