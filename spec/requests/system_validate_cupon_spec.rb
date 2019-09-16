require 'rails_helper'

describe 'system validate cupon for use' do
	it 'cupon is valid for use'do 
		carnaval = create(:promotion,name:'Carnaval',cod_promotion:'CARNA')
		cupon = create(:cupon,promotion_id:carnaval.id)

		get "/api/v1/promotions/#{carnaval.id}/cupons/#{cupon.code}/validate"

		json_validate = JSON.parse(response.body,symbolize_names: true)

		expect(response.status).to eq 200
		expect(json_validate[:message]).to eq('Cupom válido')
	end

	it 'cupon not found 'do
		carnaval = create(:promotion,name:'Carnaval',cod_promotion:'CARNA')
		get "/api/v1/promotions/#{carnaval.id}/cupons/000/validate"

		json_validate = JSON.parse(response.body,symbolize_names: true)

		expect(response.status).to eq 404
		expect(json_validate[:message]).to eq('Cupom não encontrado para esta promoção')
	end

	it 'cupon invalid for use 'do
		carnaval = create(:promotion,name:'Carnaval',cod_promotion:'CARNA')
		registration = create(:registration)
		cupon = create(:cupon,promotion_id:carnaval.id,registration_id:registration.id)
		
		get "/api/v1/promotions/#{carnaval.id}/cupons/#{cupon.code}/validate"

		json_validate = JSON.parse(response.body,symbolize_names: true)

		expect(response.status).to eq 200
		expect(json_validate[:message]).to eq('Cupom não encontrado para esta promoção')
	end

end	