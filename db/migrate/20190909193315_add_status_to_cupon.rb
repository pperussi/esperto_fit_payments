class AddStatusToCupon < ActiveRecord::Migration[5.2]
  def change
    add_column :cupons, :status, :integer, default: 0
  end
end
