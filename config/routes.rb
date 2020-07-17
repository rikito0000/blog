Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] 
  
  resources :articles do
    resources :comments,  only: [:new, :create]
    resource :like, only: [:create, :destroy]
    resource :store, only:  [:create, :destroy]
  end
  
  resources :stores, only:  [:index]
  resource :profile, only: [:show, :new, :create, :edit, :update]

end
