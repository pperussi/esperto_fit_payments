class SingleClassesController < ApplicationController
  def new
    @single_class = SingleClass.new
  end

  def show
    #@client= Client.find(params[:id])
    @single_class = SingleClass.find(params[:id])  
  end

  def update
    @single_class = SingleClass.new(set_params)
    if @single_class.save
      redirect_to @single_class
    end
  end

  def create
    #@client = Client.find(params[:id])
    @single_class = SingleClass.new(set_params)
    #@single_class.client_id = @client.id ###
    if @single_class.save
      redirect_to @single_class
    end
  end

  private
  def set_params
    params.require(:single_class).permit(:clients_id,:name, :unit,:price,:date)
  end
end