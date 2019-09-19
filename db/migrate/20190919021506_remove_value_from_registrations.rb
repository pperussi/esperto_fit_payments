class RemoveValueFromRegistrations < ActiveRecord::Migration[5.2]
  def change
    remove_column :registrations, :value, :float
  end
end
