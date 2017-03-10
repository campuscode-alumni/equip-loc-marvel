Rails.application.routes.draw do
  root 'home#index'
  resources :budgets, only: [:new, :create, :index]
  resources :prices, only: [:new, :create, :show]
  resources :contracts, only: [:new, :create, :show, :index]
  resources :equipment, only: [:new, :create, :show, :index]
  resources :equipment_types, only: [:new, :create, :show]
  resources :customers, only: [:new, :create, :show, :index]
end
