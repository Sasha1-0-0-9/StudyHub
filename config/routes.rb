Rails.application.routes.draw do
  get '/main', to: 'pages#main'
  get '/faq', to: 'pages#faq'
  get '/about', to: 'pages#about'
  resources :tasks do
    resources :orders
  end

  resources :comments

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  ActiveAdmin.routes(self)
  resources :categories do
    resources :tasks
  end

  resources :orders do
    member do
      post '/appoint', to: 'orders#appoint', as: 'appoint'
      get 'complete'
    end
  end

  resources :categories do
    member do
      get 'show_tasks'
    end
  end
  resources :contacts

  resources :users do
    member do
      get 'profile'
    end
    patch :save_profile, on: :collection
  end

  resources :reviews
  root 'pages#home'
end
