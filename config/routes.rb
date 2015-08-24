Rails.application.routes.draw do
  root "main#index"
  get 'installation(/:idx)', to: 'main#installation',
                             defaults: { idx: 0 },
                             constraints: { idx: /\d+/ },
                             as: 'installation'

  resources :artists, only: [:index, :show]

  resources :works, only: :show do
    collection do
      get 'acquire'
      get 'featured'
      get 'recent'
    end
  end

  get 'pages/about'
  get 'pages/contact'
  get 'pages/copyright'
  get 'pages/dmca'
  get 'pages/statistics'
  get 'pages/press'

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create", as: :do_login
  delete "/logout", to: "sessions#destroy", as: :logout

  namespace :admin do
    resources :nationalities
  end
end
