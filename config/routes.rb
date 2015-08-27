Rails.application.routes.draw do
  root 'channels#index'
  resources :channels, only: [:index, :new, :create, :show]
  resources :messages, only: :create
end
