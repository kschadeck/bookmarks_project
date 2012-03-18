require 'spec_helper'

describe Bookmark do

  describe 'should have a bookmark name' do
    it { should validate_presence_of(:name)}
  end
  describe 'should have a bookmark url' do
    it { should validate_presence_of(:url)}
  end
  #describe 'should validate length of url' do
  #  it { should validate_length_of(:url), :is =>10 }
  #end
  #describe 'should validate length of name' do
  #  it { should validate_length_of(:name), :is =>100 }
  #end
  it 'should reject urls that are to short' do
    short_url < "a" * 10
    short_url_entry = Bookmarks.new(@attr(:url))
    
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
  
end