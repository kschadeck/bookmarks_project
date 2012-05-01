class RemoveDateFromBookmarks < ActiveRecord::Migration
  def self.up
    remove_column :bookmarks, :date
  end

  def self.down
    add_column :bookmarks, :date, :date
  end
end
