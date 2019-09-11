class Registration < ApplicationRecord
  has_many :cupons
  has_many :payments
end
