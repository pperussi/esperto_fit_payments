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
pagamento = PayMethod.create(name: 'Bitcoin', tax: 0, limit_days: 15)
reg = Registration.create(name: 'Paula',cpf: '123456',unity: unidade, plan: plano, pay_method: pagamento)
reg_unpaid = Registration.create(name: 'Patrick',cpf: '4444444444',unity: unidade, plan: plano, pay_method: pagamento)
Payment.create(value: 15, dt_venc: Time.zone.now.to_date , registration: reg, pay_method: pagamento,status: :closed )
(2..12).each do |i|
  Payment.create!(value: 15, dt_venc: Time.zone.now.to_date + i.month , registration: reg, pay_method: pagamento,status: :pending )
end
Payment.create(value: 15, dt_venc: Time.zone.now.to_date , registration: reg_unpaid, pay_method: pagamento,status: :closed )
(2..12).each do |i|
  Payment.create!(value: 15, dt_venc: Time.zone.now.to_date + i.month , registration: reg_unpaid, pay_method: pagamento,status: :pending )
end
