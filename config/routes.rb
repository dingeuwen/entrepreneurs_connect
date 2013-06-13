Cssdash::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  # resources :favorites

  devise_for :users

  resources :comments

  root :to => 'pages#index', :as => 'university_home_page'
  # Create new idea
  get '/ideas/new', :to => 'ideas#new', :as => 'new_idea'
  get '/ideas', :to => 'ideas#index', :as => 'all_ideas'
  post '/ideas', :to => 'ideas#create'
  # Edit idea
  get '/ideas/:id/edit',  :to => 'ideas#edit', :as => 'edit_idea'
  # Show idea
  get '/ideas/:id', :to => 'ideas#show', :as => 'idea'
  # delete idea
  delete '/ideas/:id', :to => 'ideas#destroy'
  # # Update idea
  # put '/ideas/:id', :to => 'ideas#update'

  get '/users/:id', :to => 'users#show', :as => 'user_show'
  # get '/users/:id/update_views', :to => 'users#update_views', :as => 'update_user_views'

  # Contributor profile
  get '/ideas/:id/update_views', :to => 'ideas#update_views', :as => 'update_views'
  get '/ideas/:id/update_favorites', :to => 'ideas#update_favorites', :as => 'update_favorites'


  # About us
  get '/aboutus', :to => 'pages#aboutus'
  # Tags
  get '/tags/:tag', :to => 'users#search_by_tag', :as => :tag
  # Search
  get '/search', :to => 'users#search'

  post '/add_to_rolodex', :to => 'rolodex_cards#add_to_rolodex'
  post '/remove_from_rolodex', :to => 'rolodex_cards#remove_from_rolodex'

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
  #

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
