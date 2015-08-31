Rails.application.routes.draw do
  root 'channels#index'
  resources :channels, only: [:index, :new, :create, :show]
  resources :messages, only: :create
  resources :registrations, only: [:new, :create, :edit, :update]
end
