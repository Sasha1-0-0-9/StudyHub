Rails.application.routes.draw do
  
  resources :tasks
  get 'users/profile'
  #devise_for :users#, ActiveAdmin::Devise.config
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  ActiveAdmin.routes(self)
  resources :categories do
  	resources :tasks
  end

  resources :users do
  	patch :save_profile, on: :collection
  end
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
