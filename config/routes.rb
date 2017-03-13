Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :budgets, only: [:new, :create]
  resources :prices, only: [:new, :create, :show]
  resources :contracts, only: [:new, :create, :show] do
    resources :delivery_receipts, only: [:create]
    resources :return_receipts, only: [ :new, :create ]
  end
  resources :equipment, only: [:new, :create, :show]
  resources :equipment_types, only: [:new, :create, :show]
  resources :customers, only: [:new, :create, :show]
  resources :delivery_receipts, only: [:show]
  resources :return_receipts, only: [ :show]
end
