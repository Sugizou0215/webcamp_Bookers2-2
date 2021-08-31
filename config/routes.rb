Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'homes/top'
  get 'homes/about'
  root to: 'homes#top'

  resources :books, except: [:new]

  resources :users, except: [:new, :create, :destroy]
end
