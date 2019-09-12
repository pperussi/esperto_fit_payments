class RegistrationsController < ApplicationController
  before_action :load_plan_unity, only: %i[new create edit update]
  before_action :authenticate_user!
  before_action :auth_redirect
  #after_action :generate_payment, only: [:create]

  def index
    @registrations = Registration.all
  end

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

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])

    if @registration.update(require_params)
      redirect_to @registration
    else
      flash.now[:alert] = 'Nao foi possivel salvar matricula'
      render :edit
    end
  end

  def paid
    @payment = Payment.find(params[:id])
    @payment.paid!
    redirect_to registration_path(@payment.registration.id)
  end

  def search
    # @registration = Registration.find_by("cpf ?", params[:search])
    @registrations = Registration.where("cpf LIKE ?", "%#{params[:search]}%")
    #redirect_to @registrations
  end

  private

  def generate_payment
    12.times do |i|
      @registration.payments.new(pay_method_id: @registration.pay_method_id, value: @registration.plan.value , dt_venc: Time.zone.now.to_date + i.month).save
    end
  end

  def load_plan_unity
    @pay_methods = PayMethod.all
    @plans = Plan.all
    @unities = Unity.all
  end

  def require_params
    params.require(:registration).permit(:name, :cpf, :unity_id, :plan_id, :pay_method_id)
  end

  def auth_redirect
    redirect_to new_user_session_path unless current_user.admin?
  end


end
