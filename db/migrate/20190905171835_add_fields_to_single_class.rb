class AddFieldsToSingleClass < ActiveRecord::Migration[5.2]
  def change
    add_column :single_classes, :name, :string
    add_column :single_classes, :unit, :string
    add_column :single_classes, :date, :date
    add_column :single_classes, :price, :float
  end
end
