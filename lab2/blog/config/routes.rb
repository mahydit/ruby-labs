Rails.application.routes.draw do
  get 'welcome/index'
  get 'sessions/home' => 'sessions#home'
  get 'sessions/login' => 'sessions#login'
  get 'sessions/profile' => 'sessions#profile'
  post 'sessions/login_attempt' => 'sessions#login_attempt'
  get 'users/new' => 'users#new'
  get "logout" => "sessions#logout"
  resources :users
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
