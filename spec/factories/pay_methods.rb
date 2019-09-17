FactoryBot.define do
  factory :pay_method do
    name { "Boleto" }
    tax { 0 }
    limit_days { 15 }
  end
end
