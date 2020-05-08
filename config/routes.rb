Rails.application.routes.draw do
  resources :gossips do
    resources :comments
    resources :likes
  end
  resources :users, only: [:show, :new, :create]
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  get 'team', to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:first_name', to: 'static_pages#welcome'
  root to: 'gossips#index'
end
