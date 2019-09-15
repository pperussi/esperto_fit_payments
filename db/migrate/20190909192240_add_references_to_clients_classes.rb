class AddReferencesToClientsClasses < ActiveRecord::Migration[5.2]
  def change
    add_reference :clients_classes, :registration, foreign_key: true
  end
end
