class PaymentTransactionsController < ApplicationController
  def new
    #byebug
    @payment = Payment.find(params[:payment_id])
    @transaction = PaymentTransaction.new
  end

  def create
    @transaction = PaymentTransaction.new(set_params)
    if @transaction.save
      redirect_to rootpath
    else
      :new
    end
  end

  def show
  end

  private
  def set_params
    params.require(:payment_transaction).permit(:code, :value, :date_payment)
  end
end