Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :celebrities
  resources :reservations, only: [ :new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/pages/components', to: 'pages#components', as: :components
end
