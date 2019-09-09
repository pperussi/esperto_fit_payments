class AddRefToClientsClasses < ActiveRecord::Migration[5.2]
  def change
    add_reference :clients_classes, :client, foreign_key: true
    add_reference :clients_classes, :single_class, foreign_key: true
  end
end
