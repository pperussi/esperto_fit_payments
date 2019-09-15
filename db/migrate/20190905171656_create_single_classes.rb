class CreateSingleClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :single_classes do |t|
      t.timestamps
    end
  end
end
