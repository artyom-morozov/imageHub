Rails.application.routes.draw do
  devise_for :users
  resources :images
  get '/categories', to: 'categories#index'
  get 'images/user/:id', to: 'images#index', as: 'images_user_path'
  root 'images#index'
  get 'images/category/:category', to: 'images#index', as: 'category_image'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
