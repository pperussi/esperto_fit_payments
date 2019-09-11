FactoryBot.define do
  factory :single_class do
    name { "Spinning" }
    price { 50 }
    unit { "LAPA"}
    date { Time.zone.now.to_date }
  end
end
