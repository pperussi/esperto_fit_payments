module Api::V1
    class RegistrationsController < ApiController

        def payments
            @registration = Registration.find_by(cpf: params[:cpf])
            render json: @registration.payments, status: 200
        end 
        # def require_params
        #     params.require(:registration).permit(:name, :cpf, :unity_id, :plan_id, :pay_method_id)
        #   end
    end
end