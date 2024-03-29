require 'spec_helper'

describe "User pages" do
  
  
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in :username,      :with => "ExampleUser"
        fill_in :name,           :with => "Example User"
        fill_in :email,          :with => "user@example.com"
        fill_in :password,      :with => "exampleuser"
        fill_in :confirmation,  :with => "exampleuser"
      end

      it "should create a user" do
        expect { click_button submit}.to change(User, :count).by(1)
      end
    end
  #  describe "sign in/out" do
  #    describe "failure" do
  #      it "should not sign a user in" do
  #        visit signin_path
  #        fill_in :email, :with => ''
  #        fill_in :password, :with => ''
  #        click_button
  #        response.should have_selector(flash[:error], :content => "Invalid")
  #      end
  #    end
  #    describe "success" do
  #      it "should sign a user in and out " do
  #        user = Factory(:user)
  #        visit signin_path
  #        fill_in :email, :with => user.email
  #        fill_in :password, :with => user.password
  #        click_button
  #        controller.should be_signed_in
  #        click_link "Logout"
  #        controller.should_not be_signed_in
  #      end
  #    end
  #  end
  #  describe "admin attribute" do
  #    before(:each) do
  #      @user = User.create!(@attr)
  #    end
  #    it "should respond to admin" do
  #      @user.should respond_to(:admin)
  #    end
  #    it "should not be an admin by default" do
  #      @user.should_not be_admin
  #    end
  #    it "should be convertible to an admin" do
  #      @user.toggle!(:admin)
  #      @user.should be_admin
  #    end
  #  end
  end
end

