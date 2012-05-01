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

require 'spec_helper'

describe Bookmark do

  describe 'should have a bookmark name' do
    it { should validate_presence_of(:name)}
  end
  
  describe 'should have a bookmark url' do
    it { should validate_presence_of(:url)}
  end
  
  describe 'should validate length of url' do
    it { should ensure_length_of(:url), :minimum => 10 }
  end
  
  describe 'should validate length of name' do
    it { should ensure_length_of(:name), :maximum => 100 }
  end

  it "should require a name" do
    Bookmark.new(:name => "").should_not be_valid
  end
  
  it "should require a url" do
    Bookmark.new(:url => "").should_not be_valid
  end

  it "should require url to have length of 10 or greater" do
    Bookmark.new(:url => "a").should_not be_valid
  end
  
  before(:each) do
    @valid_attributes = {
      :name => "websitename",
      :url => "www.websitename.com"
    }
  end
  describe "user associations" do

    before(:each) do
      @bookmark = @user.bookmarks.create(@attr)
    end
 
    it "should have a user attribute" do
        @bookmark.should respond_to(:user)
    end

    it "should have the right associated user" do
        @bookmark.user_id.should == @user.id
        @bookmark.user.should == @user
    end
  end
end
