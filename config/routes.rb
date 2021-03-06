Rails.application.routes.draw do
  root "main#index"
  get 'installation(/:idx)', to: 'main#installation',
                             defaults: { idx: 0 },
                             constraints: { idx: /\d+/ },
                             as: 'installation'

  resources :artists, only: [:index, :show] do
    get :autocomplete_artist_name, on: :collection
  end
  resources :contacts, only: [:new, :create]
  resources :exhibitions, only: :show

  get 'exhibitions/:exhibition_id/works(/:idx)', to: 'exhibitions/works#show',
                                                 defaults: { idx: 0 },
                                                 constraints: { idx: /\d+/ },
                                                 as: 'exhibition_works'

  resources :works, only: :show do
    collection do
      get :acquire
      get :featured
      get :recent
    end
  end

  get 'pages/about'
  get 'pages/contact'
  get 'pages/copyright'
  get 'pages/dmca'
  get 'pages/statistics'
  get 'pages/press'

  resources :contacts, only: [:new, :create]

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create", as: :do_login
  delete "/logout", to: "sessions#destroy", as: :logout

  namespace :admin do
    resources :artists
    resources :images, only: :destroy do
      collection do
        post :caption_edit
      end
    end
    resources :nationalities
    resources :works do
      resources :images, only: [:new, :destroy] do
        get :add, on: :collection
      end
      member do
        post :sort_images
      end
    end
  end
end
