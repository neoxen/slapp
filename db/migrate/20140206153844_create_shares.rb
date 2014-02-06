class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :user_id
      t.date :sharing_date
      t.string :sharing_content
      t.integer :sum_graded
      t.integer :total_grade
      t.string :remark

      t.timestamps
    end
  end
end
