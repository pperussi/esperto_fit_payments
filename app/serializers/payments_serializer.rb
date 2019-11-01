class PaymentsSerializer < ActiveModel::Serializer
    attributes :value, :dt_venc, :status
end