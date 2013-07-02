class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :remark

      t.timestamps
    end
  end
end
