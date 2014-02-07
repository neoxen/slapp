class AddIsArchivedToShares < ActiveRecord::Migration
  def change
    add_column :shares, :is_archived, :boolean, :default => false
  end
end
