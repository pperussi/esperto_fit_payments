class SingleClass < ApplicationRecord
  has_many :clients_classes
  has_many :clients, through: :clients_classes
end
