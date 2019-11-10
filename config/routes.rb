Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: 'admins/registrations', passwords: 'admins/passwords' }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: 'users/registrations', passwords: 'users/passwords' }
  root "beers#index"
  get 'list', to: 'beers#list'
  
  resources :beers, only: [:create, :show, :update, :destroy] do
    resources :posts, only: [:create, :show, :update, :destroy] do
      resources :comments, only: [:create, :show, :update, :destroy]
    end
  end
end