class CreatePaymentsReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :payments_releases do |t|
      t.string :name
      t.float :value
      t.references :payment, foreign_key: true

      t.timestamps
    end
  end
end
