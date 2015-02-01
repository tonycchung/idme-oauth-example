Rails.application.routes.draw do
  resources :products, only: [:index, :create, :edit, :destroy]
  resource :shopping_cart

  root 'products#index'
  get 'auth/idme/callback' => 'sessions#create'
  get 'signout' => 'sessions#destroy', as: :signout
  get 'auth/failure' => redirect('/')

end
