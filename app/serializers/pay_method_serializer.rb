class PayMethodSerializer < ActiveModel::Serializer
    attributes :id, :name, :tax, :limit_days
end