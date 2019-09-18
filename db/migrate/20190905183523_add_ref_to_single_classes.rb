class AddRefToSingleClasses < ActiveRecord::Migration[5.2]
  def change
    add_reference :single_classes, :clients, foreign_key: true
  end
end
