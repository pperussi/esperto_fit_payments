class SingleClass < ApplicationRecord
  has_many :clients_classes
  has_many :registrations, through: :clients_classes

  validates :name, uniqueness: true, presence: true
  validates :unit, :price, presence: true

  def class_debit(registration)
    first_pending = registration.payments.find_by(status: :pending)
    PaymentsRelease.create(name: name, value: price,
                           payment: first_pending)
    value = price+first_pending.value
    first_pending.update(value: value)
  end
end
