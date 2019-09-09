class CreateClientsClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :clients_classes do |t|

      t.timestamps
    end
  end
end
