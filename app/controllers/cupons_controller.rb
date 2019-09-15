class CuponsController < AdministratorController
  def create
    @promotion = Promotion.find(params[:promotion_id])
    Cupon.create_for(@promotion)
    redirect_to  @promotion
  end
end