class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.date :order_date
      t.string :dish_name
      t.decimal :dish_price
      t.string :remark

      t.timestamps
    end
    add_index :orders, [:user_id, :order_date]
  end
end
