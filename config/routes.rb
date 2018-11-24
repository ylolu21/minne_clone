Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :top
  resources :users
  resources :products
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
