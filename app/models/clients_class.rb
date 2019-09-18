class ClientsClass < ApplicationRecord
  belongs_to :registration
  belongs_to :single_class
end
