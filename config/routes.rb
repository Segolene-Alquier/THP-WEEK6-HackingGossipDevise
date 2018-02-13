Rails.application.routes.draw do
  get 'gossips/index'

  get 'gossips/new'

  get 'gossips/create'

  get 'gossips/show'

  root 'gossips#new'
  devise_for :users
end
