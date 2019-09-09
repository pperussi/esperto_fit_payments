class Registration < ApplicationRecord
  belongs_to :plan
  belongs_to :unity
  belongs_to :pay_method
  
  has_many :payments

  validates :name, :cpf, presence: true
  validates :cpf, uniqueness:true

  #
  has_many :clients_classes
  has_many :single_classes, through: :clients_classes
end
