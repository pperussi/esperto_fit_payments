class CreatePaymentTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_transactions do |t|
      t.string :code
      t.float :value
      t.date :date_payment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
