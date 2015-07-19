Rails.application.routes.draw do
  root "main#index"

  get "/login" => "sessions#new", :as => :login
  post "/login" => "sessions#create", :as => :do_login
  delete "/logout" => "sessions#destroy", :as => :logout

  namespace :admin do
    resources :nationalities
  end
end
