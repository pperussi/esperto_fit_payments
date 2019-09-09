class SingleClass < ApplicationRecord
  has_many :clients_classes
  has_many :registrations, through: :clients_classes
end
