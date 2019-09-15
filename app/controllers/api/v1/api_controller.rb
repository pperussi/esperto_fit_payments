class Api::V1::ApiController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    private
    def render_not_found
        render json: 'Não encontrado', status: 404
    end
end
