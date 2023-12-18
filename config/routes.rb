Rails.application.routes.draw do
  # Sign in / Sign up
  resources :users, only: [:new, :create]
  resource :session, controller: 'session', only: [:new, :create, :destroy]
  get '/' => 'session#new', constraints: { host: Rails.application.config.x.main_host }

  # Resources
  resource :current_user, controller: 'current_user', only: [:edit, :update]
  resources :sites
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Check if a domain has been registered to our application
  get "check_domain" => 'check_domain#show'

  # to be replaced by Maglev default route
  root 'public_site#show'
end
