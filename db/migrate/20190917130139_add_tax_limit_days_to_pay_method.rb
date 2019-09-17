class AddTaxLimitDaysToPayMethod < ActiveRecord::Migration[5.2]
  def change
    add_column :pay_methods, :tax, :float
    add_column :pay_methods, :limit_days, :integer
  end
end
