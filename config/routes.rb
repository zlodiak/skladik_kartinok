Rails.application.routes.draw do
  
  devise_for :users

  #get 'persons/profile'

  resources :images
  post "image_poll_associated" => 'images#image_poll_associated'

  resources :users do
    resources :polls
    resources :albums
    get "get_album_data/:id" => 'albums#get_album_data'
    get "get_poll_data/:id" => 'polls#get_poll_data'    
  end

  get "poll_list" => 'polls#poll_list'


  get 'persons/profile', as: 'user_root'
  match 'images/create_direct', to: 'images#create_direct', via: :post
  #match "get_image_data/:id", to: 'image#get_image_data', via: :post
  get "get_image_data/:id" => 'images#get_image_data'

  namespace :admin do
    resources :images
    resources :users
    get "" => 'images#index'
  end


  # You can have the root of your site routed with "root"
  root 'images#index'

  #devise_for :users, :controllers => { registrations: 'registrations' }

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Exampомогу)le of named route that can be invoked with purchase_url(id: product.id)
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
