class Api::V1::SingleClassController < Api::V1::ApiController
  def create
    @registration = Registration.where("cpf LIKE ?", params[:single_class][:cpf]).take!
    @single_class = SingleClass.create(set_params)
    ClientsClass.create!(registration:@registration, single_class: @single_class)
    @single_class.class_debit(@registration)
    render json: '',status: :created
  end

  private
  def set_params
    params.require(:single_class).permit(:name, :unit, :price, :date)
  end
end