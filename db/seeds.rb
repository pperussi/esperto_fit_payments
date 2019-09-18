require 'faker'
I18n.reload!

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@espertofit.com', password:'123456', admin: true)
Plan.create(name: 'Mestre', value: Faker::Number.decimal(l_digits: 3, r_digits: 2))
Unity.create(name: 'Barra Funda')
PayMethod.create(name: 'Bitcoin')
10.times do
  Registration.create(name: Faker::Name.name, cpf: Faker::IDNumber.brazilian_citizen_number, unity_id: 1, plan_id: 1, pay_method_id: 1)
end

# Plan.create(name: 'Master', value: 150.44)
# Unity.create(name: 'Barra Funda')
# User.create(email: 'admin@espertofit.com', password:'123456', admin: true)
# PayMethod.create(name: 'Bitcoin')
# Registration.create(name: 'Fulano de Tal', cpf: '123345567', unity_id: 1,
#         plan_id: 1, pay_method_id: 1)
