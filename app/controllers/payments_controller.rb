class  PaymentsController < ApplicationController

  def new
    @method_pay = Payment.new
  end
  
  def create
    @method_pay =  Payment.create(params_payment)
    flash[:alert] = "Cadastrado com sucesso"
    byebug
    redirect_to administrator_index_path
  end

  private

  def params_payment
    params.require(:payment).permit(:pay_method)
  end

end
