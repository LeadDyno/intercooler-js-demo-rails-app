IntercoolerRailsDemo::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  post 'welcome/script' => 'welcome#script'

  get 'flash' => 'welcome#flash_div'

  post 'flash_notice' => 'welcome#flash_notice'
  post 'flash_alert' => 'welcome#flash_alert'

  get 'basics' => 'basic#index'
  match 'basics/counter' => 'basic#counter', via: :all

  resources :contacts do
    collection do
      match :table, via: [:get, :post]
      get :click_to_edit
    end
  end

  get 'slick_nav/tab1' => 'slick_nav#tab1'
  get 'slick_nav/tab2' => 'slick_nav#tab2'
  get 'slick_nav/tab3' => 'slick_nav#tab3'

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
