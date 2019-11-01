class MailerWorker
    include Sidekiq::Worker
  
    def perform(email, num)
        PaymentMailer.invoice_single_class(email)
        .deliver_now
    end
  end