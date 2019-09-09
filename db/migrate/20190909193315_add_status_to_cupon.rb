class AddStatusToCupon < ActiveRecord::Migration[5.2]
  def change
    add_column :cupons, :status, :boolean, default: true
  end
end
