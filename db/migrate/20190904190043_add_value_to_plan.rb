class AddValueToPlan < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :value, :float
  end
end
