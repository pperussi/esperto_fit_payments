class RemovePayMethodFromPayments < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :pay_method, :boolean
  end
end
