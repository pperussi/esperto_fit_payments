class  PayMethodsController < AdministratorController

  def new
    @method_pay = PayMethod.new
  end
  
  def create
    @method_pay = PayMethod.new(params_payment)
    if @method_pay.save
      flash[:alert] = 'Cadastrado com sucesso'
      redirect_to administrator_index_path
    else
      render :new
    end
  end

  private

  def params_payment
    params.require(:pay_method).permit(:name)
  end
  
end
