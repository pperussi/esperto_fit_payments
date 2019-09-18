class Registration < ApplicationRecord
  belongs_to :plan
  belongs_to :unity
  belongs_to :pay_method
  has_many :cupons
  has_many :payments
  has_many :cupon_burns

  validates :name, :cpf, presence: true
  validates :cpf, uniqueness:true

    def generate_payment
    12.times do |i|
      self.payments.new(pay_method_id: self.pay_method_id, value: self.plan.value , dt_venc: Time.zone.now.to_date + i.month).save
    end
  end
end
