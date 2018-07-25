Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'

  resources :categories, only: [:index, :show]
  resources :organizations, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
