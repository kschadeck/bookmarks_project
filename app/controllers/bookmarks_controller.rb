class BookmarksController < ApplicationController
    before_filter :authenticate
    before_filter :authorized_user, :only => :destroy
  
  caches_action :layout => false
  
  def index
    @bookmarks = Bookmark.all
    @title = "Bookmarks"
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @title = @bookmark.name
  end

  def new
    @bookmark = Bookmark.new
    @title = "New Bookmark"
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @title = "Edit Bookmarks"
  end

  def create
    #@user = User.find(params[:user_id])
    bookmark = current_user.bookmarks.build(params[:bookmark])
    if bookmark.valid?
      @user.save
      redirect_to root_path, :flash => {:success => "Bookmark created!"}
    else
      render "users/show"
    end
  end
  #def add_bookmark
  #  @user = User.find(params[:user_id])
  #  bookmark = @user.bookmarks.build(param[:bookmark])
  #  if  (bookmark.valid?)
  #    @user.save
  #    redirect_to @user
  #  else
  #    @errors = bookmark.errors
  #    render 'show'
  #  end
  #end
  # PUT /bookmarks/1
  # PUT /bookmarks/1.xml
  def update
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to(@bookmark, :notice => 'Bookmark was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to current_user, :flash => {:success => "Bookmark deleted!"}
    end

   private
        def authorized_user
            @bookmark = Bookmark.find(params[:id])
            redirect_to root_path unless current_user?(@bookmark.user)
        end
  
end
