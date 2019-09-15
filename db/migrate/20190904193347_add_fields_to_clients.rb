class AddFieldsToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :name, :string
    add_column :clients, :unit, :string
    add_column :clients, :date, :date
    add_column :clients, :price, :string
  end
end
