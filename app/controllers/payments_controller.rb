class  PaymentsController < AdministratorController
  def new
    @method_pay = Payment.new
  end
  
  def create
    @method_pay =  Payment.new(params_payment)
    if @method_pay.save
      flash[:alert] = "Cadastrado com sucesso"
      redirect_to administrator_index_path
    else
      render :new
    end
  end

  private

  def params_payment
    params.require(:payment).permit(:pay_method)
  end

end
