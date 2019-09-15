FactoryBot.define do
  factory :payment_transaction do
    code {'MyString'}
    value { 1.5 }
    date_payment {'2019-09-12'}
    user { nil }
  end
end
