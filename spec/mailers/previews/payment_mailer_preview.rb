# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview
    def welcome_email
        email = 'email@email.com'
        PaymentMailer.invoice_single_class(email).deliver_now
    end
end