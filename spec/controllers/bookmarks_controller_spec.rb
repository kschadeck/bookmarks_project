require 'spec_helper'

describe BookmarksController do
  render_views
  # This should return the minimal set of attributes required to create a valid
  # Bookmark. As you add validations to Bookmark, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :name => "TheRubyWebsite",
      :url => "www.therubywebsite.com",
      :id => "1" 
    }
  end

  describe "GET index" do
    it "should be successful" do
      get :index
      response.should be_success
    end
    it "should have the right title" do
      get :index
      response.should have_selector("title",
                    :content => "BookmarksProject")
    end   
    it "assigns all bookmarks as @bookmarks" do
      bookmark = Bookmark.create! valid_attributes
      get :index
      assigns(:bookmarks).should eq([bookmark])
    end
  end

  describe "GET show" do
    it "assigns the requested bookmark as @bookmark" do
      bookmark = Bookmark.create! valid_attributes
      get :show, :id => bookmark.id.to_s
      assigns(:bookmark).should eq(bookmark)
    end
  end

  describe "POST new" do
    it "assigns a new bookmark as @bookmark" do
      get :new
      assigns(:bookmark).should be_a_new(Bookmark)
    end
  end

  describe "GET edit" do
    it "assigns the requested bookmark as @bookmark" do
      bookmark = Bookmark.create! valid_attributes
      get :edit, :id => bookmark.id.to_s
      assigns(:bookmark).should eq(bookmark)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Bookmark" do
        expect {
          post :create, :bookmark => valid_attributes
        }.to change(Bookmark, :count).by(1)
      end

      it "assigns a newly created bookmark as @bookmark" do
        post :create, :bookmark => valid_attributes
        assigns(:bookmark).should be_a(Bookmark)
        assigns(:bookmark).should be_persisted
      end

      it "redirects to the created bookmark" do
        post :create, :bookmark => valid_attributes
        response.should redirect_to(Bookmark.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bookmark as @bookmark" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bookmark.any_instance.stub(:save).and_return(false)
        post :create, :bookmark => {}
        assigns(:bookmark).should be_a_new(Bookmark)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bookmark.any_instance.stub(:save).and_return(false)
        post :create, :bookmark => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bookmark" do
        bookmark = Bookmark.create! valid_attributes
        # Assuming there are no other bookmarks in the database, this
        # specifies that the Bookmark created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Bookmark.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => bookmark.id, :bookmark => {'these' => 'params'}
      end

      it "assigns the requested bookmark as @bookmark" do
        bookmark = Bookmark.create! valid_attributes
        put :update, :id => bookmark.id, :bookmark => valid_attributes
        assigns(:bookmark).should eq(bookmark)
      end

      it "redirects to the bookmark" do
        bookmark = Bookmark.create! valid_attributes
        put :update, :id => bookmark.id, :bookmark => valid_attributes
        response.should redirect_to(bookmark)
      end
    end

    describe "with invalid params" do
      it "assigns the bookmark as @bookmark" do
        bookmark = Bookmark.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bookmark.any_instance.stub(:save).and_return(false)
        put :update, :id => bookmark.id.to_s, :bookmark => {}
        assigns(:bookmark).should eq(bookmark)
      end

      it "re-renders the 'edit' template" do
        bookmark = Bookmark.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bookmark.any_instance.stub(:save).and_return(false)
        put :update, :id => bookmark.id.to_s, :bookmark => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bookmark" do
      bookmark = Bookmark.create! valid_attributes
      expect {
        delete :destroy, :id => bookmark.id.to_s
      }.to change(Bookmark, :count).by(-1)
    end

    it "redirects to the bookmarks list" do
      bookmark = Bookmark.create! valid_attributes
      delete :destroy, :id => bookmark.id.to_s
      response.should redirect_to(bookmarks_url)
    end
  end
end
