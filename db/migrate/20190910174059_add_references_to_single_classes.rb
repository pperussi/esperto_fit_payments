class AddReferencesToSingleClasses < ActiveRecord::Migration[5.2]
  def change
    add_reference :single_classes, :registration, foreign_key: true
  end
end
