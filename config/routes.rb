StoreEngine::Application.routes.draw do
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

  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'
  match 'register' => 'users#new'
  match 'cart' => 'carts#index'

  namespace :admin do
    resources :products do
      get 'visible'
      get 'unvisible'
    end
    resources :categories
  end
  match 'admin/dashboard' => 'admin/dashboard#index'
  match 'admin/dashboard/:id' => 'admin/dashboard#show', as: :admin_dashboard_show
  match 'admin/dashboard/:id/add/:sale_id' => 'admin/dashboard#add', as: :admin_dashboard_add
  match 'admin/dashboard/:id/del/:sale_id' => 'admin/dashboard#del', as: :admin_dashboard_del
  match 'admin/dashboard/:id/cancel' => 'admin/dashboard#cancel', as: :admin_dashboard_cancel
  match 'admin/dashboard/:id/return' => 'admin/dashboard#return', as: :admin_dashboard_return
  match 'admin/dashboard/:id/ship' => 'admin/dashboard#ship', as: :admin_dashboard_ship

  resources :sessions
  resources :users
  resources :products
  resources :categories
  
  match '/cart/:product_id/add' => 'carts#add', as: :cart_add
  match '/cart/:product_id/del' => 'carts#del', as: :cart_del
  match '/cart/empty' => 'carts#empty', as: :cart_empty
  match '/cart/checkout' => 'carts#checkout', as: :cart_checkout
  match '/cart/quick_order/:product_id' => 'carts#quick_order', as: :quick_order
  
  match '/orders' => 'orders#index', as: :orders
  match '/orders/:id' => 'orders#show',as: :order

  root :to => 'products#index'

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
