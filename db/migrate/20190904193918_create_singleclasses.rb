class CreateSingleclasses < ActiveRecord::Migration[5.2]
  def change
    create_table :singleclasses do |t|

      t.timestamps
    end
  end
end
