Rails.application.routes.draw do
  devise_for :users
  get 'broadcast/index'

  get 'broadcast/show'

  get 'broadcast/new'

  get 'broadcast/create'

  get 'broadcast/edit'

  get 'broadcast/update'

  get 'broadcast/delete'

  get 'team/index'

  get 'team/show'

  get 'team/new'

  get 'team/create'

  get 'team/edit'

  get 'team/update'

  get 'team/delete'

  get 'event/index'

  get 'event/show'

  get 'event/new'

  get 'event/create'

  get 'event/edit'

  get 'event/update'

  get 'event/delete'

  get 'venue/index'

  get 'venue/show'

  get 'venue/new'

  get 'venue/create'

  get 'venue/edit'

  get 'venue/update'

  get 'venue/delete'

  get 'group/index'

  get 'group/show'

  get 'group/new'

  get 'group/create'

  get 'group/edit'

  get 'group/update'

  get 'group/delete'

  get 'fan/index'

  get 'fan/new'

  get 'fan/create'

  get 'fan/edit'

  get 'fan/update'

  get 'fan/delete'

  get 'session/login'

  get 'session/signup'

  get 'session/logout'

  get 'welcome/index'

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
