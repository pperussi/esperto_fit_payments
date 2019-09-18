module Api::V1
  class UnityController < ApiController

    def create
      @unity = Unity.new(set_params)
      return render json: @unity, status: 201 if @unity.save!
      render json: {msg: 'Dados inválidos'}, status: 404
    end

    def index
      @unity = Unity.all
      return render json: @unity, only: [:name, :id], status: 200 if @unity != nil
    end

    private

    def set_params
      params.require(:unity).permit(:name)
    end
  end
end