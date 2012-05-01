# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Bookmark < ActiveRecord::Base
    belongs_to :user
    
    attr_accessible :name, :url
  
  validates :name, :url, :presence => true,
                    :length =>  { :maximum => 100 }
  validates :url, :presence => true,
                    :length => { :minimum => 10}
                    
    validates :user_id, :presence => true
                     
    default_scope :order => "bookmarks.created_at DESC"
end
