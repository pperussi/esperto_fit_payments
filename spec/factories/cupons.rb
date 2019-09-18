FactoryBot.define do
  factory :cupon do
    promotion_id { nil }
    code { "BLACKFRYDAY001" }
    status {0}
  end
end
