class CuponsController < AdministratorController
  before_action :authenticate_user!
  before_action :set_promotion , only: %i[ apply] 
  before_action :finish_promotion , only: %i[ apply] 
  before_action :admin, only: %i[create] 
   

  def create
    @promotion = Promotion.find(params[:promotion_id])
    if @promotion.cupons.count == @promotion.cupom_number
      flash[:notice]= 'Já foram criados todos os cupons desta promoção'
      redirect_to_promotion
    else  
      Cupon.create_for(@promotion)
      redirect_to_promotion
    end
  end

  def apply
    @promotion = Promotion.find(params[:promotion_id])
    @cupon = Cupon.find_by!(code: params[:code])
    @registration = Registration.find(params[:registration_id])
      if @cupon.active?
        @cupon.applied!
        CuponBurn.create(cupon: @cupon, registration: @registration)
        new_value
        redirect_to_promotion
      else  
        flash[:alert] = 'Cupom já foi utilizado;'
        redirect_to_promotion 
      end
    rescue ActiveRecord::RecordNotFound 
      flash[:alert] = 'Cupom nāo encontrado;' if @cupon.blank?
      flash[:notice] = 'Matrícula nāo encontrada;' if @registration.blank?
      redirect_to_promotion
  end  

  private
  def admin
    redirect_to root_path unless current_user.admin?
  end

  def new_value
    @registration = Registration.find(params[:registration_id])
    CuponBurn.apply_cupon(@registration, @cupon.promotion.value_percent_discount, @cupon.promotion.discount_max)
  end

  def finish_promotion
    if @promotion.end_promotion.to_date < Date.current
      flash[:notice] = 'Esta promoçāo já foi encerrada'
      redirect_to_promotion
    end
  end  

  def set_promotion
    @promotion = Promotion.find(params[:promotion_id])
  end

  def redirect_to_promotion
    redirect_to @promotion
  end
end