class CreatePromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :promotions do |t|
      t.string :name
      t.text :description
      t.integer :value_percent_discount
      t.integer :discount_max
      t.string :cod_promotion
      t.integer :cupom_number
      t.string :begin_promotion
      t.string :end_promotion

      t.timestamps
    end
  end
end
