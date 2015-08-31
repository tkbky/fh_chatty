Rails.application.routes.draw do
  root 'pages#landing'

  resources :channels, only: [:index, :new, :create, :show]
  resources :messages, only: :create
  resources :registrations, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
end
