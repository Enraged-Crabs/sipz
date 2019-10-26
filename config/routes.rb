Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations', passwords: 'passwords'}
  root "beers#index"
  resources :beers, only: [:new, :create]
end