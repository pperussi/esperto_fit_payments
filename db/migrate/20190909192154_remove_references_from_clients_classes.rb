class RemoveReferencesFromClientsClasses < ActiveRecord::Migration[5.2]
  def change
    remove_reference :clients_classes, :client, foreign_key: true
  end
end
