class Api::V1::PaymentsController < Api::V1::ApiController
    def show
        @payments = Registration.where("cpf LIKE ?", params[:id]).take!
        render json: @payments, only: :cpf , status: :ok , include: {payments:{only: %i[value dt_venc status]}}
    end
end
