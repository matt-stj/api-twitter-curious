Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/twitter', as: 'login'
  get '/auth/twitter/callback' => 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :tweets, only: [:new, :create]
end
