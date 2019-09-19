require 'rails_helper'

describe 'API notify registration for generated payments', type: :request do
  let(:plan) { create(:plan) }
  let(:unity) { create(:unity) }
  let(:pay_method) { create(:pay_method) }
  let(:headers) do
    {
      'Content-Type': Mime[:json].to_s
    }
  end

  describe 'POST /api/v1/notifications' do
    before do
      post '/api/v1/notifications', params: { client: client_params }.to_json,
                                    headers: headers
    end

    context 'when request are valid' do
      let(:client_params) do
        attributes_for(:registration, plan_id: plan.id,
                                      unity_id: unity.id,
                                      pay_method_id: pay_method.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end

      it 'returns json data for created registration' do
        expect(json_body).to have_key(:payments)
        expect(json_body[:payments][7][:value]).to eq plan.value
        expect(json_body[:payments][7][:dt_venc]).to eq pay_method.payments[7]
                                                                  .dt_venc.to_s
      end
    end

    context 'when request are invalid' do
      let(:client_params) { attributes_for(:registration, plan_id: 'Executivo') }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns json data for created user' do
        expect(json_body).to have_key(:errors)
      end
    end
  end
end
