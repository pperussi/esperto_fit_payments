class PaymentsController < ApplicationController

  def show
    @payment = Payment.find(params[:id])
  end

  def paid
    @payment = Payment.find(params[:id])
    @payment.active_status!
  end
  
end