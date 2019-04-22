Rails.application.routes.draw do
  devise_for :users
  get 'index', to: 'home#index', as: 'index'
  # get 'profile', action: :show, controller: 'users'

  resources :articles do
    resources :comments
  end
  
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
