class AddFieldToPaymentTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :payment_transactions, :payment, foreign_key: true
  end
end
