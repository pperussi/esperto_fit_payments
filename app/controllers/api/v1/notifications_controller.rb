class Api::V1::NotificationsController < Api::V1::ApiController

  def create
    @registration = Registration.new(set_params)

    if @registration.save
      @registration.generate_anual_payments
      render json: @registration, status: :created
    else
      render json: { errors: @registration.errors },
             status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:client).permit(:name, :cpf, :plan_id, :pay_method_id,
                                   :unity_id)
  end
end
