Rails.application.routes.draw do
  devise_for :users
  root to: 'motorcycles#home'
  get '/users/:id', to: 'users#show', as: :user_show
end
