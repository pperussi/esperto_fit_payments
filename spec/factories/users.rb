FactoryBot.define do
  factory :user do
    email {'email@espertofit.com'}
    password {123456}
    admin { false }
  end
end
