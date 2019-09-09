class CreateCupons < ActiveRecord::Migration[5.2]
  def change
    create_table :cupons do |t|
      t.references :promotion, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
