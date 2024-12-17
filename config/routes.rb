Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root "recipes#index"
  resources :recipes, only: [:index, :show, :new, :create]

  get '/auth/failure', to: redirect('/')
  delete '/logout', to: 'sessions#destroy'
end
