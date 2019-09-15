class CuponsController < AdministratorController
  before_action :is_admin, only: %i[ create]
  
  def create
    @promotion = Promotion.find(params[:promotion_id])
    Cupon.create_for(@promotion)
    redirect_to  @promotion
  end
end