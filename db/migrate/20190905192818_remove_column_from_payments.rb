class RemoveColumnFromPayments < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :pay_method, :string
  end
end
