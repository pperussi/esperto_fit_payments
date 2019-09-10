class SingleClassesController < ApplicationController
  
  def new
    @registration = Registration.find(params[:registration_id])
    @single_class = SingleClass.new
  end

  def show
    @client = SingleClass.find(params[:id])
    @single_class = SingleClass.find(params[:id])  
  end

  def create
    @registration = Registration.find(params[:id])
    @single_class = SingleClass.new(set_params) 
    ClientsClass.create!(registration:@registration, single_class: @single_class)
    #@single_class.client_id = @client.id ###
    if @single_class.save
      redirect_to @single_class
    end
  end

  def update
    @registration = Registration.find(params[:id])
    @single_class = SingleClass.new(set_params)
    ClientsClass.create!(registration:@registration, single_class: @single_class)
    if @single_class.save
      redirect_to @single_class
    end
  end

  private
  def set_params
    params.require(:single_class).permit(:name, :unit,:price,:date)
  end
end