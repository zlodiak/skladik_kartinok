Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile', as: 'user_root'  

  resources :images, except: [:edit]
  post "image_poll_associated" => 'images#image_poll_associated'
  match 'images/create_direct', to: 'images#create_direct', via: :post
  get "get_image_data/:id" => 'images#get_image_data'     

  resources :users do
    resources :albums
    get "get_album_data/:id" => 'albums#get_album_data'

    resources :polls, except: [:edit]    
    get "get_poll_data/:id" => 'polls#get_poll_data'     
    post "polls/:id" => 'polls#show'     
  end

  get "poll_list" => 'polls#poll_list'
  post "change_poll_state" => 'polls#change_poll_state'    

  namespace :admin do
    resources :images
    resources :users
    get "" => 'images#index'
    get "statistics" => 'statistics#index'
  end

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
