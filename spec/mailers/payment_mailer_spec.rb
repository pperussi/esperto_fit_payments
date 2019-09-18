require "rails_helper"

RSpec.describe PaymentMailer, type: :mailer do
  describe '#invoice_single_class' do
    let(:registration) { build_stubbed(:registration, email: 'pay@test.com') }
    let(:mail) { described_class.invoice_single_class(registration) }

    it 'renders subject correctly' do
      expect(mail.subject).to eq 'Comprovante aula avulsa'
    end

    it 'renders emails correctly' do
      expect(mail.from).to include 'payment@espertofit.com.br'
      expect(mail.to).to include 'pay@test.com'
    end

    it 'renders body correctly' do
      expect(mail.body).to include 'Seu pagamento está disponível'
      expect(mail.body.encoded).to include '<a href="http://example.com/">'\
                                           'Acesse aqui</a>'
    end
  end
end
