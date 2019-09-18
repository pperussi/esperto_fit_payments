class Api::V1::CuponsController < Api::V1::ApiController


  
	def validate
		@promotion = Promotion.find(params[:promotion_id])
		@cupon = @promotion.cupons.find_by!(params[:code])

			if @cupon.active?
				render json: {message: 'Cupom válido'}, status: :ok
			else 	
				render json: {message:'Cupom já foi utilizado'},status: :bad_request
      end
    rescue ActiveRecord::RecordNotFound
      render json: {message:'Cupom não encontrado para esta promoção'},status: :not_found
	end
end

