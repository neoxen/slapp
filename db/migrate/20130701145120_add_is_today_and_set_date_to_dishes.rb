class AddIsTodayAndSetDateToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :is_today, :boolean
    add_column :dishes, :set_date, :date
  end
end
