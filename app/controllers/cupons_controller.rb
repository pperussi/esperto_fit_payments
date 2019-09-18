class CuponsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin, only: %i[ create apply]

  def create
    @promotion = Promotion.find(params[:promotion_id])
    if @promotion.cupons.count == @promotion.cupom_number
      byebug
      flash[:notice]= 'Já foram criados todos os cupons desta promoção'
      redirect_to_promotion
    else  
      Cupon.create_for(@promotion)
      redirect_to_promotion
    end
  end

  def apply
    @promotion = Promotion.find(params[:promotion_id])
    @cupon = Cupon.find_by(code: params[:code])
    @registration = Registration.find(params[:registration_id])
    if @cupon.blank?
      flash[:alert] = 'Cupom nāo encontrado;'
      redirect_to_promotion
    else
      if @cupon.burned?
        flash[:alert] = 'Cupom já utilizado;'
        redirect_to_promotion
      else   
        @cupon.applied!
        CuponBurn.create(cupon: @cupon, registration: @registration)
        new_value
        redirect_to_promotion
      end
    end
  rescue ActiveRecord::RecordNotFound 
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

  def redirect_to_promotion
    redirect_to @promotion
  end
end