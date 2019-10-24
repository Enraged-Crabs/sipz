Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations', passwords: 'passwords'}
  root "sipz#index"
  resources :sipz, only: [:new, :create]
end