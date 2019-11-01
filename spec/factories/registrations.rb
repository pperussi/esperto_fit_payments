FactoryBot.define do
  factory :registration do
    name { "Zé" }
    cpf { "123456" }
    sequence(:email) { |n| "test#{n}@test.com.br" }
    plan
    unity
    pay_method
  end
end
