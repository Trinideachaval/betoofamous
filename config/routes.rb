Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :celebrities do
    resources :reservations, only: [ :new, :create, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/pages/components', to: 'pages#components', as: :components
  get '/dashboard', to: 'dashboards#profile', as: :profile
end
