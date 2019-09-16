class Api::V1::CuponsController < Api::V1::ApiController

	def validate
		@promotion = Promotion.find(params[:promotion_id])
		@cupon = @promotion.cupons.where(params[:code])
		if @cupon.empty?
			render json: {message:'Cupom não encontrado para esta promoção'},status: :not_found
		else
			if @cupon.active
				render json: {message: 'Cupom válido'}, status: :ok
			else 	
				render json: {message:'Cupom já foi utilizado'},status: :ok
			end
		end
	end
end