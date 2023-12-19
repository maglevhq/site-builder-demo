Rails.application.routes.draw do
  # Sign in / Sign up
  resources :users, only: [:new, :create]
  resource :session, controller: 'session', only: [:new, :create, :destroy]
  
  # Resources
  resource :current_user, controller: 'current_user', only: [:edit, :update]
  resources :sites
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Check if a domain has been registered to our application
  get "check_domain" => 'check_domain#show'

  # Root of the main domain -> sign in
  get '/' => 'session#new', constraints: { host: Rails.application.config.x.main_host }

  # [MAGLEV] For more information, go to https://doc.maglev.dev
  # [MAGLEV] Editor UI + preview endpoint
  mount Maglev::Pro::Engine => '/maglev', as: :maglev

  # [Maglev] Sitemap.xml
  get '/sitemap.xml', to: 'maglev/sitemap#index', constraints: Maglev::PreviewConstraint.new(preview_host: true)

  # [MAGLEV] CMS, catch all the routes
  get '(*path)', to: 'maglev/page_preview#index', defaults: { path: 'index' }, constraints: Maglev::PreviewConstraint.new
end
