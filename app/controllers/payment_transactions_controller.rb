class PaymentTransactionsController < ApplicationController
  def new
    @payment = Payment.find(params[:payment_id])
    @transaction = PaymentTransaction.new
  end

  def create

  end

  def show
  end
end