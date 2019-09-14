class PaymentTransactionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @payment = Payment.find(params[:payment_id])
    @transaction = PaymentTransaction.new
  end

  def create
    @transaction = PaymentTransaction.new(set_params)
    @payment = Payment.find(params[:payment_id])
    @transaction.payment = @payment
    @transaction.user = current_user
    if @transaction.save!
      @payment.paid!
      redirect_to payment_payment_transaction_path(@transaction.payment, params[:payment_id])
    else
      render :new
    end
  end

  def show
    @payment = Payment.find(params[:payment_id])
    @transaction = PaymentTransaction.find_by(payment_id: [params[:payment_id]])
    #@transaction = @payment.payment_transactions.find(params[:id])
  end

  private
  def set_params
    params.require(:payment_transaction).permit(:code, :value, :date_payment, :user, :payment_id)
  end
end