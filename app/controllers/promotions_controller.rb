class PromotionsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin, only: %i[index new create]

  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
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

  def admin
    return promotion_path unless current_user.admin?
  end

  private
    def promotion_params
      params.require(:promotion).permit(:name, :description, :value_percent_discount, :discount_max, :cod_promotion, :cupom_number, :begin_promotion, :end_promotion) 
    end  
end