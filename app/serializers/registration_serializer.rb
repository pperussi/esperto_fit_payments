class RegistrationSerializer < ActiveModel::Serializer
    attributes :cpf, :payments    

    def payments
        object.payments.map do |payment|
            PaymentsSerializer.new(payment)
        end
    end

end