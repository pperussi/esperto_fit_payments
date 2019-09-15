class Api::V1::NotificationsController < Api::V1::ApiController
  def show
    @registration = Registration.find(params[:id])
    generate_anual_payments
    render json: @registration, only: %i[name cpf], status: 201,
           include: { payments: { only: %i[status value dt_venc] } }

  rescue ActiveRecord::RecordNotFound
    render json: {}, status: 404
  end

  private

  def generate_anual_payments
    12.times do |i|
      Payment.create(registration_id: @registration.id, pay_method_id: @registration.pay_method_id, value: @registration.plan.value , dt_venc: Time.zone.now.to_date + i.month).save
    end
  end

end
