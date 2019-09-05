class AddPaymethodsToPayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :pay_method, foreign_key: true
  end
end
