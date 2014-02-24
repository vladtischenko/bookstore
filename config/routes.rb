Bookstore::Application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => redirect('/home')
  resources :books do
    resources :ratings
  end
  resources :ratings
  resources :authors
  resources :users, only: [:show]
  resources :categories, only: [:index, :show]
  resources :bill_addresses
  resources :ship_addresses
  resources :orders
  resources :order_items

  get '/home', to: 'books#news'
  get '/users/:user_id/orders', to: 'orders#index', as: :user_orders
  get '/users/:user_id/orders/cart', to: 'orders#cart', as: :user_orders_cart
  get '/categories/:category_id/books', to: 'books#get_by_category', as: :category_books
  get '/users/:user_id/orders/cart/empty', to: 'orders#empty', as: :empty_cart

  # get '/books/:id/details', to: 'books#details', as: :book_details
  # get 'books/:id/add_rating/:rating_id', to: 'books#add_rating', as: :book_add_rating


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
