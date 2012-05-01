require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Sign in")
  end
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  it "should have a signup at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  it "should have a signin page at '/signin'" do
    get '/signin'
  response.should have_selector('title', :content => "Sign in")
  end
  it "should have links for signed_out user" do
    visit root_path
    response.should have_selector('title', :content => "Sign in")
    click_link "Sign Up"
    response.should have_selector('title', :content => "Sign up")
    click_link "Help"
    response.should have_selector('title', :content => "Help")
  end

  describe "when not signed in" do
    it "should have a signin link" do
    visit signin_path
    response.should have_selector('title', :content => "Sign in")
    end
  end
  
  describe "when signed in" do
    
    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email, :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                          :content => "Logout")
    end
    it "should have a profile link" do
      visit edit_user_path(@user)
      response.should have_selector('title', :content => "Profile")
    end
    it "should have a help link" do
    visit root_path
    response.should have_selector("a", :href => help_path,
    :content => "Help")
    end
  end 
end