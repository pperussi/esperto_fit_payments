class PaymentMailer < ApplicationMailer
  def invoice_single_class(registration)
    @registration = registration

    mail(to: @registration.email, subject: 'Comprovante aula avulsa')
  end
end
