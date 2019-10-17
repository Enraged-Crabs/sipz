Rails.application.routes.draw do
  devise_for :users
  root "sipz#index"
  resources :sipz, only: [:new, :create]
end
