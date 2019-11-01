class PaymentMailer < ApplicationMailer
    def invoice_single_class(email)
  
      mail(to: email, subject: 'Comprovante aula avulsa')
    end
  end