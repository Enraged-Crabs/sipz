Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations', passwords: 'passwords'}
  root 'sips#index'
  get 'list', to: 'sips#list'
  resources :sips, only: [:new, :create, :show, :edit, :update, :destroy]

end