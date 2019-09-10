FactoryBot.define do
  factory :promotion do
    name { "MyString" }
    description { "MyText na na na na na na na na Batman " }
    value_percent_discount { 10 }
    discount_max { 10 }
    cod_promotion { "MyString" }
    cupom_number { 5 }
    begin_promotion { "MyString" }
    end_promotion { "MyString" }
  end
end
