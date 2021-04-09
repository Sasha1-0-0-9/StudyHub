Rails.application.routes.draw do
  get '/main', to: 'pages#main'
  resources :tasks do
    resources :orders#s, only: %i[create update]
  end

  resources :comments


  # devise_for :users#, ActiveAdmin::Devise.config
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  ActiveAdmin.routes(self)
  resources :categories do
    resources :tasks
  end

  resources :orders do
    member do
  #    get 'show'
      get 'complete'
    end
  end

  resources :orders
  resources :users do
   resources :reviews, only: [:new, :create]
end

  resources :categories do
  	member do
  		get 'show_tasks'
  	end
  end
  #get '/show', to: 'users#show'
 
  resources :users do
    member do
      get 'profile'
    end
        patch :save_profile, on: :collection
  end
  #get 'users/:id', to: 'users#show'
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
