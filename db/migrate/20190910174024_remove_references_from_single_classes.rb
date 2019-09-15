class RemoveReferencesFromSingleClasses < ActiveRecord::Migration[5.2]
  def change
    remove_reference :single_classes, :clients, foreign_key: true
  end
end
