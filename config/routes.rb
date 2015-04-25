Rails.application.routes.draw do

  scope :controller => "manage_devices", :path => "/manage", :as => "manage" do
    get 'index'
    get 'newed/:id' => :newed, :as => "newed"
    get 'change/:id' => :change, :as => "change"
    get 'pass_newed/:id' => :pass_newed, :as => "pass_newed"
    get 'pass_change/:id' => :pass_change, :as => "pass_change"
    get 'branch_devices/:branch_id/list/:mode' => :branch_devices, :as => "branch_devices"
    get 'show/:id' => :show, :as => "show"
  end

  resources :devices do 
    member do
      get 'category'
    end
    resources :photos
  end

  resources :categories

  resources :branches
  resources :members

  get 'home/index' 
  get 'home/user_info'

  # devise_for :users, controllers: { session: 'users/sessions' }
  devise_for :users do
    get 'users/sign_out' => 'devise/session#destroy'
  end
  # devise_for :users, path: "auth", path_name: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
