Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :meetings
  resources :users, only: %i[show edit destroy update]

  root "meetings#index"
end
