class CreateRecharges < ActiveRecord::Migration
  def change
    create_table :recharges do |t|
      t.date :recharge_date
      t.decimal :recharge_amount
      t.integer :user_id
      t.string :remark
      t.string :operator

      t.timestamps
    end
  end
end
