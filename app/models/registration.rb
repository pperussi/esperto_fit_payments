class Registration < ApplicationRecord
  belongs_to :plan
  belongs_to :unity
  has_many :payments

  validates :name, :cpf, presence: true
  validates :cpf, uniqueness:true

end
