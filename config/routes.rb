Rails.application.routes.draw do
  root :to =>'submissions#index'
  resources :submissions do
  resources :votes#, module: :submission
  end
  resources :account_activations, only: [:edit] do
  end
  default_url_options :host => "localhost"
  resources :password_resets, only: [:new, :create, :edit, :update]
  # Log in and log out routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :logins, only: %i(new create) do
  end

end
