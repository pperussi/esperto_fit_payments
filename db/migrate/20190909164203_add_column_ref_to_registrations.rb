class AddColumnRefToRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_reference :registrations, :pay_method, foreign_key: true
  end
end
