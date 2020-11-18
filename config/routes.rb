Rails.application.routes.draw do
  devise_for :users

  resources :motorcycles do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index,:destroy]

  root to: 'motorcycles#home'
  get '/users/:id', to: 'users#show', as: :user_show
  get '/users/:id/show_motorcycle', to: 'users#show_motorcycle', as: :show_motorcycle_user
  get '/users/:id/bookings', to: 'users#index', as: :your_bookings
end
