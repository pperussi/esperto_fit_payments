class CuponsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin, only: %i[ create apply]

  def create
    @promotion = Promotion.find(params[:promotion_id])
    Cupon.create_for(@promotion)
    redirect_to  @promotion
  end

  def apply
    @promotion = Promotion.find(params[:promotion_id])
    @cupon = Cupon.find_by(code: params[:code])
    @registration = Registration.find(params[:registration_id])
    if @cupon.applied?
    flash.now[:notice]= 'Cupom já foi utilizado'
    else
      @cupon.applied!
      CuponBurn.create(cupon: @cupon, registration: @registration)
      new_value
      redirect_to @promotion
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Cupom nāo encontrado;' if @cupon.blank? 
    flash[:notice] = 'Matrícula nāo encontrada;' if @registration.blank?
    redirect_to @promotion
  end  

  private
  def admin
    redirect_to root_path unless current_user.admin?
  end

  def params_cupon
    params.require(:cupon).permit(:registration_id)
  end

  def new_value
    CuponBurn.apply_cupon(@registration, @cupon.promotion.value_percent_discount)
  end


end