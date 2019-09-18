class Api::V1::CuponsController < Api::V1::ApiController
  before_action :authenticate_user!

  def apply
    @promotion = Promotion.find(params[:promotion_id])
    @cupon = Cupon.find_by(code: params[:code])
    @registration = Registration.find(params[:registration_id])
    if @cupon.blank?
      render json: {message: 'Cupom não encontrado'}
    else
      if @cupon.burned?
         render json: {message: 'Cupom já utilizado;'}
      else   
        @cupon.applied!
        CuponBurn.create(cupon: @cupon, registration: @registration)
        new_value
        render json: {message:'Cupom aplicado com sucesso'}
      end
    end
  rescue ActiveRecord::RecordNotFound
    render json: {message:'Matrícula nāo encontrada;'}
  end  
		

	def validate
		@promotion = Promotion.find(params[:promotion_id])
		@cupon = @promotion.cupons.where(params[:code])
		if @cupon.empty?
			render json: {message:'Cupom não encontrado para esta promoção'}, status: :not_found
		else
			if @cupon.applied
				render json: {message:'Cupom já foi utilizado'}, status: :ok
 
			else 	
				render json: {message: 'Cupom válido'}, status: :ok		
			end
		end
	end

	def new_value
    @registration = Registration.find(params[:registration_id])
    CuponBurn.apply_cupon(@registration, @cupon.promotion.value_percent_discount, @cupon.promotion.discount_max)
  end
end