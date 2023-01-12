Rails.application.routes.draw do
  resources :qrcodes
  resources :bindus
  resources :menus
  resources :restaurants do
    end
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/order', to: 'bindus#order'
  get '/show_order', to: 'qrcodes#show_order', as: :my_link
  get '/current_user_qrcodes_bindu', to: 'qrcodes#current_user_qrcodes_bindu'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  end