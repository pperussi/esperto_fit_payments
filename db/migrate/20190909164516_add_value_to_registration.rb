class AddValueToRegistration < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :value, :float
  end
end
