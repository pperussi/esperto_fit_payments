class  PayMethodsController < AdministratorController
  def index
    @pay_method = PayMethod.all
  end

  def new
    @pay_method = PayMethod.new
  end

  def create
    @pay_method =  PayMethod.new(params_payment)

    if @pay_method.save
      flash[:alert] = "Cadastrado com sucesso"
      redirect_to pay_methods_path
    else
      render :new
    end
  end

  private

  def params_payment
    params.require(:pay_method).permit(:name)
  end
end
