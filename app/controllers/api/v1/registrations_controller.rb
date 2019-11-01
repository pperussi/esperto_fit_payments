module Api::V1
  class RegistrationsController < ApiController
    def payments
      @registration = Registration.find_by(cpf: params[:cpf])
      return render json: @registration.payments, status: 200 if @registration != nil
      render json: {msg: 'CPF não encontrado'}, status: 404
    end

    def create
      @registration = Registration.new(set_params)
      if @registration.save!
        generate_payment
        render json: @registration, status:201
      end
    rescue ActiveRecord::RecordInvalid
      render json: {msg: 'Dados inválidos'}, status: 404
    end

    private
    
    def generate_payment
      @registration.generate_anual_payments
    end

    def set_params
      params.require(:registration).permit(:name, :cpf, :unity_id, :plan_id, :pay_method_id)
    end
  end
end