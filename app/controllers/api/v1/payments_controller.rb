class Api::V1::PaymentsController < Api::V1::ApiController
  def show
    @registration = Registration.where('cpf LIKE ?', params[:id]).take!
    render json: @registration
  end

  def ban
    @payments = Registration.find_by!(cpf: params[:cpf])
    @payments.payments.each do |payment|
      payment.update(status: :canceled) if payment.status == 'pending'
    end
    render json: { msg: "CPF #{@payments.cpf} com todas as suas faturas \
                        canceladas" }, status: :ok
  end
end
