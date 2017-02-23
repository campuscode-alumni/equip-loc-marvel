Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :equipment, only: [:new, :create, :show]
  resources :prices, only: [:new, :create, :show]
end
