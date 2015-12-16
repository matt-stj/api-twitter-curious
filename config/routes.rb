Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/twitter', as: 'login'
  get '/auth/twitter/callback' => 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:index]

  resources :tweet, only: [:new, :create]
end
