Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: 'admins/registrations', passwords: 'admins/passwords' }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: 'users/registrations', passwords: 'users/passwords' }
  root "beers#index"
  get 'list', to: 'beers#list'
  
  resources :beers, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :posts
  end

end