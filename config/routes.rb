Rails.application.routes.draw do
  root 'pages#landing'

  resources :channels, only: [:index, :new, :create, :show]
  resources :messages, only: :create

  # Registrations
  resources :registrations, only: [:create, :edit, :update]
  get '/signup' => 'registrations#new', as: :sign_up

  # Sessions
  resources :sessions, only: :create
  get '/signin' => 'sessions#new', as: :sign_in
  delete '/signout' => 'sessions#destroy', as: :sign_out
end
