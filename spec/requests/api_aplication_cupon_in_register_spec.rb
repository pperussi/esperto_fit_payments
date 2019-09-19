require 'rails_helper'

describe 'Application cupon ' do
	it 'successfully'do 
		user = create(:user)
		carnaval = create(:promotion,name:'Carnaval',cod_promotion:'CARNA')
		cupon = create(:cupon,promotion_id:carnaval.id)
		registration = create(:registration) 
		registration.generate_anual_payments
		login_as(user)

		post "/api/v1/promotions/#{carnaval.id}/apply" , params: {code:cupon.code, registration_id:registration.id}

		expect(response.status).to eq 200
		expect(response.body).to include('Sucesso ao aplicar cupom')
	end

	it 'fail in use again'do 
		user = create(:user)
		carnaval = create(:promotion,name:'Carnaval',cod_promotion:'CARNA')
		cupon = create(:cupon,promotion_id:carnaval.id)
		registration = create(:registration) 
		registration.generate_anual_payments
		CuponBurn.create(cupon:cupon,registration:registration)
    CuponBurn.apply_cupon(registration,cupon.promotion.value_percent_discount,carnaval.discount_max)
    cupon.applied!
		login_as(user)

		post "/api/v1/promotions/#{carnaval.id}/apply" , params: {code:cupon.code, registration_id:registration.id}

		expect(response.status).to eq 200
		expect(response.body).to include('Este cupom já foi utilizado')
	end

	it 'promotion is finished'do 
		user = create(:user)
		carnaval = create(:promotion,name:'Carnaval',cod_promotion:'CARNA',end_promotion:'10/09/2019')
		cupon = create(:cupon,promotion_id:carnaval.id)
		registration = create(:registration) 
		registration.generate_anual_payments

		login_as(user)

		post "/api/v1/promotions/#{carnaval.id}/apply" , params: {code:cupon.code, registration_id:registration.id}

		expect(response.status).to eq 200
		expect(response.body).to include('Esta promoçāo já foi encerrada')
	end

	it ' not_found'do 
		user = create(:user)
		carnaval = create(:promotion,name:'Carnaval',cod_promotion:'CARNA')
		registration = create(:registration) 
		registration.generate_anual_payments

		login_as(user)

		post "/api/v1/promotions/#{carnaval.id}/apply" , params: {code:"CARNA0003", registration_id:registration.id}

		expect(response.status).to eq 404
		expect(response.body).to include('Cupom nāo encontrado')
	end

end	