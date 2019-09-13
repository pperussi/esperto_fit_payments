class PaymentController < ApplicationController

  def paid
    @payment = Payment.find(params[:id])
    @payment.active_status!
  end
end