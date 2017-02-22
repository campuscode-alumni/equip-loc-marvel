Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :contracts, only: [:new, :create, :show]
  resources :equipment, only: [:new, :create, :show]

end
