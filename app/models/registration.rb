class Registration < ApplicationRecord
  belongs_to :plan
  belongs_to :unity
  belongs_to :pay_method
  has_many :cupons
  has_many :payments

  validates :name, :cpf, presence: true
  validates :cpf, uniqueness:true

end
