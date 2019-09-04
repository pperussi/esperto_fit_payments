class AddFieldToSingleclass < ActiveRecord::Migration[5.2]
  def change
    add_column :singleclasses, :name, :string
    add_column :singleclasses, :unit, :string
    add_column :singleclasses, :date, :date
    add_column :singleclasses, :price, :float
  end
end
