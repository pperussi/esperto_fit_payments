# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
plano = Plan.create(name: 'Executivo', value: 40)
unidade = Unity.create(name: 'Barra Funda')
User.create(email: 'admin@espertofit.com', password:'123456', admin: true)
pagamento = PayMethod.create(name: 'Bitcoin', tax: 0, limit_days: 15)
Promotion.create(name:'Natal',description:'Venha para nossa ceia Venha para nossa ceia' ,value_percent_discount:20, discount_max:15, cod_promotion:'NATAL', cupom_number:10, begin_promotion:'28/01/2019', end_promotion:'15/09/2020')
reg = Registration.create(name: 'Paula',cpf: '123456',unity: unidade, plan: plano, pay_method: pagamento)
reg_unpaid = Registration.create(name: 'Patrick',cpf: '4444444444',unity: unidade, plan: plano, pay_method: pagamento)
Payment.create(value: 40, dt_venc: Time.zone.now.to_date , registration: reg, pay_method: pagamento,status: :closed )
Payment.create(value: 40, dt_venc: Time.zone.now.to_date , registration: reg_unpaid, pay_method: pagamento,status: :unpaid )

(2..12).each do |i|
  Payment.create!(value: 40, dt_venc: Time.zone.now.to_date + i.month , registration: reg,        pay_method: pagamento, status: :pending )
  Payment.create!(value: 40, dt_venc: Time.zone.now.to_date + i.month , registration: reg_unpaid, pay_method: pagamento, status: :pending )
end
