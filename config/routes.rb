Bookstore::Application.routes.draw do
  # devise_for :users
  # devise_for :users, :controllers => {:registrations => "registrations"}

  devise_for :users, :controllers => { #:registrations => "registrations", 
                                      :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    # get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session 
  end

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
  resources :credit_cards

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/home', to: 'books#news'
  get '/users/:user_id/orders', to: 'orders#index', as: :user_orders
  get '/users/:user_id/orders/cart', to: 'orders#cart', as: :user_orders_cart
  get '/categories/:category_id/books', to: 'books#get_by_category', as: :category_books
  get '/users/:user_id/orders/cart/empty', to: 'orders#empty', as: :empty_cart

  get 'checkouts/address', to: 'checkouts#address', as: :checkout_address
  get 'checkouts/delivery', to: 'checkouts#delivery', as: :checkout_delivery
  get '/checkouts/payment', to: 'checkouts#payment', as: :checkout_payment
  get '/checkouts/confirm', to: 'checkouts#confirm', as: :checkout_confirm
  get '/checkouts/complete', to: 'checkouts#complete', as: :checkout_complete
  post 'checkouts/set', to: 'checkouts#set_addresses', as: :checkout_set_addresses
  post '/checkouts/set_delivery', to: 'checkouts#set_delivery', as: :checkout_set_delivery
  post '/checkouts/payment', to:'checkouts#payment', as: :checkout_set_payment
  get '/checkouts/set_complete', to: 'checkouts#set_complete', as: :checkout_set_complete

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
