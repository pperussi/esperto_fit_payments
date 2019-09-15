require 'rails_helper'

describe 'API notify registration', type: :request do
  let(:registration) { create(:registration) }
  let(:registration_id) { registration.id }
  let(:headers) do
    {
      'Content-Type': Mime[:json].to_s,
      Accept: 'application/vnd.payment.v1'
    }
  end

  describe 'GET /notifications' do
    before do
      get "/notifications/#{registration_id}", params: {}, headers: headers
    end

    context 'when request are valid' do
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns the json with the data' do
        expect(json_body).to have_key(:payments)
        expect(json_body[:payments][7][:value]).to eq registration.plan.value
        expect(json_body[:payments][7][:dt_venc]).to eq registration.payments[7].dt_venc.to_s
      end
    end

    context 'when request are invalid' do
      let(:registration_id) { 1000 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
