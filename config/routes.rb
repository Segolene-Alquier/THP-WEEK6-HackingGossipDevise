Rails.application.routes.draw do
  get 'home/index'

  get 'users/new', to: 'users#new'

  resources :gossips

  post 'gossips/new', to: 'gossips#create'
  #get 'gossips/index'

  #get 'gossips/new'
  #post 'gossips/new'

  #get 'gossips/create'
  #post 'gossips/create'

  #get 'gossips/show'
  root 'gossips#index'
  get 'home/warning', to: 'home#warning'
  devise_for :users
end
