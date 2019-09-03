FactoryBot.define do
  factory :user do
    adm { false }
    email { "teste@teste.com" }
    password{ "123456" }
  end
end
