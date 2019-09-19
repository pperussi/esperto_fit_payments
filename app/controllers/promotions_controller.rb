class PromotionsController < AdministratorController
  before_action :is_admin, only: %i[ new create]

  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
    @registration = Registration.find_by(params[:id])
    @cupons = @promotion.cupons
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to @promotion
    else
      flash.now[:alert] = 'Nāo foi possível salvar a promoçāo'
      render :new
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description,
                                      :value_percent_discount, :discount_max,
                                      :cod_promotion, :cupom_number,
                                      :begin_promotion, :end_promotion)
  end
end