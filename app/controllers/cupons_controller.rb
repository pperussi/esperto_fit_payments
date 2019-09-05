class CuponsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @promotion = Promotion.find(params[:promotion_id])
    Cupon.create_for(@promotion)
    redirect_to  @promotion
  end

  def admin
    return promotions_path unless current_user.admin?
  end

end