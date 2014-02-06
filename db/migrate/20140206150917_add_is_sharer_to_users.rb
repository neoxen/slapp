class AddIsSharerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_sharer, :boolean , :default => true
  end
end
