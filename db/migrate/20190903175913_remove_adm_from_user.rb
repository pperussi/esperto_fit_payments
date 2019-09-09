class RemoveAdmFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :adm, :boolean
  end
end
