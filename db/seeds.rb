User.create(email: 'admin@espertofit.com', password:'123456', admin: true)

plan_master = Plan.create(name: 'Master', value: 400)
plan_basic = Plan.create(name: 'Basic', value: 80)
plan_premium = Plan.create(name: 'Premium', value: 130)
Plan.create(name: 'VIP', value: 200)

unity_BF = Unity.create(name: 'Barra Funda')
unity_S = Unity.create(name: 'Santana')
unity_P = Unity.create(name: 'Paulista')

pay_bitcoin = PayMethod.create(name: 'Bitcoin', tax: 10, limit_days: 7)
pay_credit = PayMethod.create(name: 'Cartão de Credito', tax: 5, limit_days: 1)
pay_billet = PayMethod.create(name: 'Boleto Bancario', tax: 0, limit_days: 15)

reg = Registration.create(name: 'Alexander',cpf: '111111111',unity: unity_BF, plan: plan_master, pay_method: pay_bitcoin)
reg_unpaid = Registration.create(name: 'John',cpf: '222222222',unity: unity_S, plan: plan_basic, pay_method: pay_billet)
reg_single_class = Registration.create(name: 'Bruna',cpf: '4444444444',unity: unity_P, plan: plan_premium, pay_method: pay_credit)

reg.generate_anual_payments
reg_unpaid.generate_anual_payments
reg_single_class.generate_anual_payments

reg_unpaid.payments[0].update(status: :unpaid)
single_class = SingleClass.create!(name: 'Boxe Quantico',
                                   unit: 'Paulista',
                                   price: 300,
                                   date:Time.zone.now.to_date)

ClientsClass.create(registration: reg_single_class, single_class: single_class)
single_class.class_debit(Registration.find(3))#aparentemente o reg_single_class fica com o ID nil

Promotion.create!(name:'Natal',description:'Venha para nossa ceia Venha para nossa ceia' ,
  value_percent_discount:20, discount_max:15, cod_promotion:'NATAL', 
  cupom_number:10, 
  begin_promotion:'15/12/2019', 
  end_promotion:'26/12/2019')

Promotion.create!(name:'Começo de ano',description:'Comece o ano novo com os nossos excelentes descontos' ,
  value_percent_discount:50, discount_max:100, cod_promotion:'GERENTE', 
  cupom_number:99, 
  begin_promotion:'01/01/2020', 
  end_promotion:'10/01/2029')
  
