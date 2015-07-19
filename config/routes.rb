Rails.application.routes.draw do
  root 'main#index'
  namespace :admin do
    resources :nationalities
  end
end
