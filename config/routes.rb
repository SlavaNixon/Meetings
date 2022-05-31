Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :comments, only: %i[create destroy]
  resources :meetings
  resources :users, only: %i[show edit destroy update]

  root "meetings#index"
end
