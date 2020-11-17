Rails.application.routes.draw do
  devise_for :users
  root to: 'motorcycles#home'
  get '/users/:id', to: 'users#show', as: :user_show
  get '/users/:id/show_motorcycle', to: 'users#show_motorcycle', as: :show_motorcycle_user

  resources :motorcycles, only: [:index, :show, :new, :create, :destroy] 

end
