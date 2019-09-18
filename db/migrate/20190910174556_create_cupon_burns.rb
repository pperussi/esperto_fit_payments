class CreateCuponBurns < ActiveRecord::Migration[5.2]
  def change
    create_table :cupon_burns do |t|
      t.belongs_to :cupon, foreign_key: true
      t.belongs_to :registration, foreign_key: true

      t.timestamps
    end
  end
end
