Rails.application.routes.draw do
  get '/main', to: 'pages#main'
  get '/faq', to: 'pages#faq'
  get '/about', to: 'pages#about'
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
  #resources :users do

#end

  resources :categories do
  	member do
  		get 'show_tasks'
  	end
  end
  #get '/show', to: 'users#show'

  resources :contacts
 
  resources :users do
       
    member do
      get 'profile'
    end
        patch :save_profile, on: :collection
  end

  resources :reviews
  #get 'users/:id', to: 'users#show'
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
