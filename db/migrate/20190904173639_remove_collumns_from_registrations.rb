class RemoveCollumnsFromRegistrations < ActiveRecord::Migration[5.2]
  def change
    remove_column :registrations, :unity, :string
    remove_column :registrations, :plan, :string
  end
end
