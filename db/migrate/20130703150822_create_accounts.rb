class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :amount
      t.string :remark

      t.timestamps
    end
  end
end
