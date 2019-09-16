FactoryBot.define do
  factory :promotion do
    name { "MyString" }
    description { "MyText" }
    value_percent_discount { 20 }
    discount_max { 20 }
    cod_promotion { "MyString" }
    cupom_number { 5 }
    begin_promotion { "15/09/2019" }
    end_promotion { "15/01/2020" }
  end
end
