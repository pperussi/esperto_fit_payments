module Api::V1
  class UnityController < ApiController

    def create
      @unity = Unity.new(set params)
    end



  private

  def set_params
    params.require(:unity).permit(:name)
  end
  end
end