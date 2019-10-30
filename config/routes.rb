Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" etc....}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" etc....}
  root "posts#index"
  resources :posts, only: [:new, :create]
end