BookmarksProject::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :bookmarks

  root :to => 'sessions#new'
  
  #Users routes
  match '/index',     :to => 'users#index'
  match '/show',      :to => 'users#show'
  match '/signup',    :to => 'users#new'  #signup_path
  match '/edit',      :to => 'users#edit'
  match '/help',      :to => 'users#help'
  
  #Session routes
  match '/signin', :to => 'sessions#new' #signin_path
  match '/signout', :to => 'sessions#destroy', :via => :delete #signout_path
  
  #Bookmarks routes
  match '/show',  :to => 'bookmarks#show' #bookmark_path(@user_id)
  match '/index', :to => 'bookmarks#index' #bookmarks_path
  
  #User Bookmark routes
  match  ':bookmarks/:new/@current_user', :to => 'bookmarks#new' #new_bookmark_path
# match ':controller(/:action(/:id(.:format)))'
 #match 'bookmarks/new/user_id', :to => 'bookmarks#new' 
  #user_new_bookmark '/users/:user_id/bookmarks/new', :controller => 'bookmarks', :action => 'new', :conditions => {:method => 'get'}
  #match  ':bookmarks/:new/:user_id', :to => '/users/:user_id/bookmarks/new' #user_new_bookmark 

end 
  
#create = sessions_path
  #GET    /bookmarks
  #POST   /bookmarks
  #GET    /bookmarks/new
  #GET    /bookmarks/:id/edit
  #GET    /bookmarks/:id
  #PUT    /bookmarks/:id
 # DELETE /bookmarks/:id


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
