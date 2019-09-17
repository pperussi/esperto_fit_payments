class Api::V1::PayMethodsController < Api::V1::ApiController
  def index
    @pay_method = PayMethod.all
    render json: @pay_method, status: :ok
  end
end
