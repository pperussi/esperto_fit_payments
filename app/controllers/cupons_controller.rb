class CuponsController < AdministratorController
  # before_action :is_admin, only: %i[ create]
  before_action :authenticate_user!
  before_action :admin, only: %i[create]

  def create
    @promotion = Promotion.find(params[:promotion_id])
    Cupon.create_for(@promotion)
    redirect_to @promotion
  end

  private

  def admin
    return promotions_path unless current_user.admin?
  end

end