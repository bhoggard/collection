Rails.application.routes.draw do
  root "main#index"

  resources :artists, only: [:index, :show]

  resources :works, only: :show do
    collection do
      get 'acquire'
      get 'featured'
      get 'recent'
    end
  end

  get "/login" => "sessions#new", :as => :login
  post "/login" => "sessions#create", :as => :do_login
  delete "/logout" => "sessions#destroy", :as => :logout

  namespace :admin do
    resources :nationalities
  end
end
