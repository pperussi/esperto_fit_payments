module Api::V1
  class PlansController < ApiController
    def create
      @plan = Plan.new(set_params)
      
      if @plan.save!
        render json:@plan, status:201
      end 
    end

    private

    def set_params
      params.require(:plan).permit(:name, :value)
    end
  end
end