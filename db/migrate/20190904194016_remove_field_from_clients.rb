class RemoveFieldFromClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :unit, :string
    remove_column :clients, :date, :date
    remove_column :clients, :price, :string
  end
end
