# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
plan = Plan.create(name:'Executivo',value:40)
unity = Unity.create(name:'Barra Funda')
User.create(email:'admin@espertofit.com',password:'123456',admin:true)
pay_method = PayMethod.create(name:'boleto')
Registration.create(name:'daniel',cpf:'12345678978',unity:unity,plan:plan,pay_method:pay_method)
