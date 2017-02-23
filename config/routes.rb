Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :budgets, only: [:new, :create]
  resources :contracts, only: [:new, :create, :show]
  resources :equipment, only: [:new, :create, :show]
  resources :customers, only: [:new, :create, :show]

end
