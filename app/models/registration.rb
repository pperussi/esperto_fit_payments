class Registration < ApplicationRecord
  
  belongs_to :plan
  belongs_to :unity
  belongs_to :pay_method

  has_many :payments
  has_many :clients_classes
  has_many :single_classes, through: :clients_classes

  validates :name, :cpf, presence: true
  validates :cpf, uniqueness: true

  def generate_anual_payments
    plan_tax_value = plan.value + (plan.value * pay_method.tax)/100
    (1..12).each do |i|
      payments.new(pay_method_id: pay_method_id, value: plan_tax_value, dt_venc: Time.zone.now.to_date + i.month).save
    end
  end

end
