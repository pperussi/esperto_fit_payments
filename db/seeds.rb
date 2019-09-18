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
PayMethod.create(name: 'Bitcoin', tax: 0, limit_days: 15)
5.times do
  Registration.create(name: Faker::Name.name, unity_id: 1, plan_id: 1,
    cpf: Faker::IDNumber.brazilian_citizen_number, pay_method_id: 1)
end
Payment.create(value: 15, dt_venc: Time.zone.now.to_date , registration: reg, pay_method: pagamento,status: :closed )
