require 'spec_helper'

describe UsersController do
  
  before(:each) do
    @user = Factory(:user)

    describe "GET 'index'" do
      it "should be successful" do
        get 'index'
        response.should be_success
      end
    end
  
    describe "GET 'show'" do
      it "should be successful" do
        get :show, :id => @user
        response.should be_success
      end
      it "should find the right user" do
        get :show, :id => @user
        assigns(:user).should == @user
      end
      it "should include the user's username" do
        get :show, :id => @user
        response.should have_selector("p", :content => @user.username)
      end
      it "should include the user's name" do
        get :show, :id => @user
        response.should have_selector("p", :content => @user.name)
      end
    end
    
    describe "GET 'new'" do
      it "should be successful" do
        get :new
        response.should be_success
      end
      it "should have the right title" do
        get 'new'
        response.should have_selector("h1", :content =>"Sign Up")
      end
    end      

    describe "GET 'edit'" do
      it "should be successful" do
        get 'edit'
        response.should be_success
      end
    end
  
    describe "GET 'create'" do
      it "should be successful" do
        get 'create'
        response.should be_success
      end
    end
    
    describe "GET 'update'" do
      it "should be successful" do
        get 'update'
        response.should be_success
      end
    end
  end
end
