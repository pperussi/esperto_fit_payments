class CuponsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin, only: %i[ create]

  def create
    @promotion = Promotion.find(params[:promotion_id])
    Cupon.create_for(@promotion)
    redirect_to  @promotion
  end

  def edit
    @cupon = Cupon.find(params[:id])
  end

  def update
    @cupon = Cupon.update(params_cupon)
  end  

  private
  def admin
    redirect_to root_path unless current_user.admin?
  end

  def params_cupon
    params.require(:cupon).permit(:registration_id)
  end

end