class AddRefRegistrationToCupon < ActiveRecord::Migration[5.2]
  def change
    add_reference :cupons, :registration, foreign_key: true
  end
end
