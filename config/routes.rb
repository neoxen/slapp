Slapp::Application.routes.draw do

  get '/users/:id/set', to: 'users#set_is_sharer', as: 'set_is_sharer'
  get '/users/:id/unset', to: 'users#unset_is_sharer', as: 'unset_is_sharer'
  get '/shares/choose', to: 'shares#choose', as: 'sharer_choose'

  resources :shares


  resources :restaurants


  resources :recharges


  resources :accounts

  match '/dish_order/:id', to: 'orders#dish_order', as: 'dish_order'
  get '/orders/list', to: 'orders#list', as: 'list_today'
  #get '/accounts/list', to:'accounts#list', as: 'list_accounts'
  #get '/account/edit/:id',to: 'accounts#edit', as: 'edit_account'

  resources :orders

  #get 'user/:id/account/show', to: 'accounts#show', as: 'show_account'
  #get 'user/:id/account/add', to: 'accounts#add', as: 'add_account'

  get '/dishes/:id/set', to: 'dishes#set_is_today', as: 'set_is_today'
  get '/dishes/:id/unset', to: 'dishes#unset_is_today', as: 'unset_is_today'

  resources :dishes

  root :to => 'index#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :posts do
    resources :comments
  end

  devise_for :users
  ActiveAdmin.routes(self)


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
