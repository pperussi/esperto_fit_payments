FactoryBot.define do
  factory :promotion do
    name {'MyString'}
    description {'MyText'}
    value_percent_discount { 1 }
    discount_max { 1 }
    cod_promotion {'MyString'}
    cupom_number { 1 }
    begin_promotion {'MyString'}
    end_promotion {'MyString'}
  end
end
