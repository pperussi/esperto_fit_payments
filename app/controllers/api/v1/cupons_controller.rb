class Api::V1::CuponsController < Api::V1::ApiController

  before_action :authenticate_user!
  before_action :set_promotion , only: %i[apply]
  before_action :finish_promotion , only: %i[ apply] 
  before_action :admin, only: %i[create] 

	def apply
    @promotion = Promotion.find(params[:promotion_id])
    @cupon = Cupon.find_by!(code: params[:code])
    @registration = Registration.find(params[:registration_id])
      if @cupon.active?
        @cupon.applied!
        CuponBurn.create(cupon: @cupon, registration: @registration)
        new_value
        render json: {message:'Sucesso ao aplicar cupom'}, status: :ok
      else  
        render json: {message:'Este cupom já foi utilizado'}, status: :ok
      end
    rescue ActiveRecord::RecordNotFound 
      render json: {message:'Cupom nāo encontrado'} ,status: :not_found
  end  
  
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


	private

		def new_value
	    @registration = Registration.find(params[:registration_id])
	    CuponBurn.apply_cupon(@registration, @cupon.promotion.value_percent_discount, @cupon.promotion.discount_max)
	  end

	  def finish_promotion
	    if @promotion.end_promotion.to_date < Date.current
	      render json: {message:'Esta promoçāo já foi encerrada'}, status: :ok
	    end
	  end  

	  def set_promotion
	    @promotion = Promotion.find(params[:promotion_id])
	  end
