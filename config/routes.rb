Rails.application.routes.draw do
  devise_for :users
  root to: 'motorcycles#home'

  resources :motorcycles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users/:id', to: 'users#show', as: :user_show
  resources :motorcycles, only: [:index, :show, :new, :create] 
end
