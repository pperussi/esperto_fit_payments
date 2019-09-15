module Api::V1
    class RegistrationsController < ApiController
        def payments
            @registration = Registration.find_by(cpf: params[:cpf])
            render json: @registration.payments, status: 200
        end 
    end
end