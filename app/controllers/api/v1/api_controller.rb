class Api::V1::ApiController < ActionController::API
  include ActionController::Serialization
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_not_found
      render json: 'Não encontrado', status: :not_found
  end
end
