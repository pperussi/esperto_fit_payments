FactoryBot.define do
  factory :cupon do
    promotion
    code { "CARNA0001" }
    status {0}
  end
end
