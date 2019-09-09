class Client < ApplicationRecord
  has_many :clients_classes
  has_many :single_classes, through: :clients_classes
end
