Wunschkiste::Application.routes.draw do

  # groups
  get "groups/new" => "groups#new", as: "new_group"
  post "groups" => "groups#create"
  get "groups/index", as: "groupadmin"
  get "groups/:id/edit" => "groups#edit", as: "edit_group"
  put "/groups/:id" => "groups#update_group", as: "group"
  get "groups/:id/editmember" => "groups#editmember", as: "editmember"
  delete "users/:id" => "users#remove", as: "remove_user"
  get "groups/addmember" => "groups#add_member", as: "add_member"
  get "groups/update_member" => "groups#member_update", as: "member_update"
  post "groups/update_member" => "groups#member_update"
  get "groups/remove_member" => "groups#remove_member", as: "remove_member"
  get "groups/remove_group" => "groups#remove_group", as: "remove_group"
  

  #Passwords / Users
  get "password_resets/new"
  get "users/pwchange" => "users#pwchange", as: "pwchange"
  put "users/pwupdate" => "users#update", as: "update"
  get "users/:id/delete" => "users#delete", as: "delete_user"
  get "users/index" => "users#index", as: "userindex"

    #display / edit / new request
    get "requests/self" => "requests#index_self", as: "own_requests"
    post "requests/others" => "requests#index_others", as: "other_requests"
    get "requests/fulfil" => "requests#select_fulfil", as: "fulfil"
   
   
    get "requests/new", as: "new_request"
    get "requests/:id/edit" => "requests#edit", as: "edit_request"
    get "requests/others/:id" => "requests#show", as: "show_request"
   
   
    get "requests/:id/release" => "requests#release", as: "release"
    
    
    put "/requests/:id/confirm" => "requests#update"
    post "requests" => "requests#create"
    put "/requests/:id" => "requests#update"
    delete "requests/:id" => "requests#destroy", as: "request"
    resources :users, only: [:new, :create]
    get "login" => "sessions#new", as: "login"
    
    #sessions
    post "sessions" => "sessions#create", as: "sessions"
    delete "logout" => "sessions#destroy", as: "logout"
   

    
    #dropdown action
    get "requests/select" => "requests#select", as: "select"
    post "requests/select" => "requests#update_requests", as: "select"
    
    #email_fulfil_list
    #get "requests#email_list", as: "email_list"
        
    #pages
    root to: 'pages#home' 
    get "users/admin" => "users#admin", as: "admin" 
    get "goodbye" => "pages#goodbye", as: "goodbye"  
    
    resources :users
    resources :sessions
    resources :password_resets
    
    
    
   
    #unused
    #get "user_change" => "activeusers#new", as: "user_change"
    #post "activeusers" => "activeusers#create", as: "activeusers"
    #post "activeusers" => "requests#index_others", as: "activeusers"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
