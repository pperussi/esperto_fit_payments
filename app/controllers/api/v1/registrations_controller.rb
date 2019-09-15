module Api::V1
    class RegistrationsController < ApiController
        def payments
            @registration = Registration.find_by(cpf: params[:cpf])
            return render json: @registration.payments, status: 200 if @registration != nil
            render json: {msg: 'CPF não encontrado'}, status: 404
        end 
    end
end