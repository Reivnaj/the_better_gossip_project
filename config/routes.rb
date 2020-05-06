Rails.application.routes.draw do
  resources :gossips
  resources :users, only: [:show]
  resources :cities, only: [:show]
  get 'team', to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:first_name', to: 'static_pages#welcome'
end
