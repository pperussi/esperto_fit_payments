require 'rails_helper'

describe 'API apply cupom' do
  let(:promotion) { create(:promotion,name:'NATAL2019',cod_promotion:'NATAL2019') }
  let(:promotion_id) { promotion.id }
  let(:cupon) { create(:cupon) }

  describe 'POST /apply' do
    before do
      post "/api/v1/promotions/#{promotion_id}/apply", params: { code: cupon.code  }
    end

    context 'when request are valid' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'verify if cupon has been used' do
        expect(json_body).to have_key(:errors)
      end
    end

    # context 'when request are invalid' do
    #   expect(response).to have_http_status(404)
    # end
  end

end 