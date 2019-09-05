class AddPayMethodToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :pay_method, :string
  end
end
