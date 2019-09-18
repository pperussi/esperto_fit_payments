module Api::V1
  class PlansController < ApiController
    def create
      @plan = Plan.new(set_params)
      
      if @plan.save!
        render json: @plan, status:201
      end 
    end

    def index
      @plan = Plan.all
      return render json: @plan, only: [ :id, :name, :value ], status: 200 if @plan != nil
    end

    def show
      @plan = Plan.where('name LIKE ?', params.dig(:plan, :name))
      return render json: @plan, status: 200 if @plan =! nil
    end

    private

    def set_params
      params.require(:plan).permit(:name, :value)
    end
  end
end