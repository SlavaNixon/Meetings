Rails.application.routes.draw do
  devise_for :users

  resources :meetings, only: %i[index show]
  resources :users, only: %i[show]

  root "meetings#index"
end
