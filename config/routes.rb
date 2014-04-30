Soccer::Application.routes.draw do


  devise_for :users, controllers: {sessions: "admins/sessions"}
  # devise_for :admins, controllers: { sessions: "admins/sessions" }

  devise_scope :user do
    get "admin", to: "admins/sessions#admin"
  end


  resources :guesses

  resources :matches

  resources :tournaments

  resources :teams

  resources :stadia

  resources :cities

  resources :stages

  resources :timezones

  resources :countries

  resources :continents

  resources :settings


  get 'main' => 'application#main'


  get 'guesses/new/:match_id/:pens' => 'guesses#new'
  get 'guesses/:id/edit/:match_id/:pens' => 'guesses#edit'
  get 'matches/:id/score' => 'matches#score'

  #get 'settings/edit' => 'matches#score'


  #edit_setting_path	 GET	 /settings/:id/edit(.:format)	 settings#edi


  root 'application#main'

  # match 'matches/index', to: 'matches/index?page=3', via: get

  #match '/', to: 'matches/index', via: get
  #get "soccer/index"
  #get "soccer/user"
  #get "soccer/admin"

  #devise_for :users, :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up =>"register"}


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
