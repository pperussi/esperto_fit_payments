class AddColumnToRegistration < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :name, :string
    add_column :registrations, :cpf, :string
    add_column :registrations, :unity, :string
    add_column :registrations, :plan, :string
  end
end
