Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  #define root path
  root 'posts#index'
  # root 'users#index'
  
  #宣告單一路徑，指定 users/ 這個 url 會對應到 users_controller 的 index method
  get 'users' => 'users#index'
  get 'posts' => 'posts#index'
  get 'categories' => 'categories#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # 或是用 resources 宣告整組路徑
  resources :posts
  resources :users,only: [:new, :create, :edit, :update, :show]
  resources :categories, only: [:index, :new, :create]
  
  resources :posts, except: [:destroy] do  #不需要destroy
    member do # 客製化連結
      post :vote
      # 這樣會產出 posts/1/vote
    end

    resources :comments, only: [:create, :show] do
      member do
        post :vote
        # 產出 posts/1/comments/1/vote
      end
    end
  end

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
