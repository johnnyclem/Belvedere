Belvedere::Application.routes.draw do
  root :to => "projects#index"
  
  resources :projects, {:archive => :get}
  resources :projects, :has_many => :clips 
  resources :clips do
    collection do
      put :update_attribute_on_the_spot
    end
  end
  resources :projects do
    # collection do
    #   put :update_attribute_on_the_spot
    # end
    
    member do
      get 'ingest' => 'ingest#index', :as => :ingests
      post 'ingest' => 'ingest#create', :as => :ingests
      get 'offload' => 'offload#index', :as => :offloads
      post 'offload' => 'offload#create', :as => :offloads
      get 'offload_proxies' => 'offload_proxies#index', :as => :offload_proxies
      post 'offload_proxies' => 'offload_proxies#create', :as => :offload_proxies
      get 'delete_masters' => 'delete_masters#index', :as => :delete_masters
    end
  end

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
