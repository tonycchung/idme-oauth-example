Rails.application.routes.draw do
  resources :products, only: [:index, :create, :edit, :destroy]
  resource :shopping_cart
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'products#index'
  get 'auth/idme/callback' => 'sessions#create'
  get 'signout' => 'sessions#destroy', as: :signout
  get 'auth/failure' => redirect('/')

end
