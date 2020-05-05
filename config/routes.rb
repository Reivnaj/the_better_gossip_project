Rails.application.routes.draw do
  resources :gossips, only: [:new, :create, :show]
  get 'team', to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:first_name', to: 'static_pages#welcome'
  root 'static_pages#index'
  get 'users/:id', to: 'static_pages#user', as: 'user'
end
