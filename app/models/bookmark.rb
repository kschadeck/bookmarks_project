class Bookmark < ActiveRecord::Base
    has_many :bookmarks
  
  validates :name, :url, :presence => true
  validates :url, :length => { :minimum => 10}
  validates :name, :length => { :maximum => 100 }
end
