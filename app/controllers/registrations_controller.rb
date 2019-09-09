class RegistrationsController < ApplicationController
  before_action :load_plan_unity, only: %i[new create]
  before_action :authenticate_user!
  before_action :auth_redirect

  def new   
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(require_params)

    if @registration.save
      generate_payment
      redirect_to @registration
    else
      flash.now[:alert] = 'Nao foi possivel salvar matricula'
      render :new
    end
  end

  def show
    @registration = Registration.find(params[:id])
  end

  private

  def generate_payment()
    12.times do |i|
      @registration.payments.new(pay_method_id: @registration.pay_method_id, value: @registration.plan.value , dt_venc: Time.zone.now.to_date + i.month).save
    end
  end

  def load_plan_unity
    @pay_methods = PayMethod.all
    @plan = Plan.all
    @unity = Unity.all
  end

  def require_params
    params.require(:registration).permit(:name, :cpf, :unity_id, :plan_id, :pay_method_id)
  end

  def auth_redirect
    redirect_to new_user_session_path unless current_user.adm?
  end


end
