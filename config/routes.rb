Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :meetings, only: %i[index show new create]
  resources :users, only: %i[show edit destroy]

  root "meetings#index"
end
