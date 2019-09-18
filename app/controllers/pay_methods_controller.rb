class  PayMethodsController < AdministratorController
<<<<<<< HEAD
=======
  def index
    @pay_method = PayMethod.all
  end
>>>>>>> 1be33665c2d246f223b620b9a5e80febfe88b171

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
    params.require(:pay_method).permit(:name, :tax, :limit_days)
  end
  
end
