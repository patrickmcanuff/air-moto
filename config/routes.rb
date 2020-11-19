Rails.application.routes.draw do
  devise_for :users

  resources :motorcycles do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index,:destroy]

  root to: 'motorcycles#home'
  get '/users/:id', to: 'users#show', as: :user_show
  get '/users/:id/show_motorcycle', to: 'users#show_motorcycle', as: :show_motorcycle_user
  post '/users/:id', to: 'users#booked_decision', as: :booked_decision
end
