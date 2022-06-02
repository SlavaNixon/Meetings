Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :meetings do
    resources :comments, only: %i[create destroy create]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]
  end

  resources :users, only: %i[show edit destroy update]

  root "meetings#index"
end
