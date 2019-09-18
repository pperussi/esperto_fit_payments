class SingleClass < ApplicationRecord
  has_many :clients_classes
  has_many :registrations, through: :clients_classes

  validates :name, :unit, :price, presence: true

  def class_debit(registration)
    price_tax = price + (price * registration.pay_method.tax)/100
    
    first_pending = registration.payments.find_by(status: :pending)
    if first_pending.dt_venc - date < registration.pay_method.limit_days
      first_pending.closed!
    end
    first_pending = registration.payments.find_by(status: :pending)
    PaymentsRelease.create(name: name, value: price_tax,
                           payment: first_pending)
    value = price_tax+first_pending.value
    first_pending.update(value: value)
  end
end
