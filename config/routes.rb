Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/twitter', as: 'login'
  get '/auth/twitter/callback' => 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:index]
  resources :tweets, only: [:new, :create, :index, :show]
  resources :favorites, only: [:create, :index, :destroy]
  resources :follow, only: [:create]
end
