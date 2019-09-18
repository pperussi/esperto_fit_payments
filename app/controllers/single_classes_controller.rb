class SingleClassesController < AdministratorController

  def new
    @registration = Registration.find(params[:registration_id])
    @single_class = SingleClass.new
  end

  def show
    @registration = SingleClass.find(params[:id])
    @single_class = SingleClass.find(params[:id])
  end

  def create
    @registration = Registration.find(params[:registration_id])
    @single_class = SingleClass.new(set_params)
    ClientsClass.create!(registration:@registration, single_class: @single_class)
    @single_class.update(date:Time.zone.now.to_date)#
    if @single_class.save
      @single_class.class_debit(@registration)
      PaymentMailer.invoice_single_class(@registration)
                   .deliver_now
      redirect_to @single_class
    else
      flash.now[:alert] = 'Não foi possível salvar a nova Aula'
      render :new
    end
  end

  private
  def set_params
    params.require(:single_class).permit(:name, :unit, :price, date: Time.zone.now.to_date)
  end
end
