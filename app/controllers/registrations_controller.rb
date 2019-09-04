class RegistrationsController < ApplicationController
  before_action :load_plan_unity, only: %i[new create]

  def new   
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(require_params)

    if @registration.save
      @registration.payments.new(value: @registration.plan.value , dt_venc: (Time.zone.now + 1.month) )
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

  def generate_payment(client)
    # Payment.create(value: client.plan.value, dt_venc: (Time.zone.now + 1.month))
  end

  def load_plan_unity
    @plan = Plan.all
    @unity = Unity.all
  end

  def require_params
    params.require(:registration).permit(:name, :cpf, :unity_id, :plan_id)
  end


end
