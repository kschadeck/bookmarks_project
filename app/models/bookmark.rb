# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  url        :string(255)
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#

class Bookmark < ActiveRecord::Base
    has_many :bookmarks
  
  validates :name, :url, :presence => true
  validates :url, :length => { :minimum => 10}
  validates :name, :length => { :maximum => 100 }
end
