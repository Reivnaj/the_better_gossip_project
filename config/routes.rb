Rails.application.routes.draw do
  get 'team', to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:first_name', to: 'static_pages#welcome'
  root 'static_pages#index'
  get 'gossips/:id', to: 'static_pages#gossip', as: 'gossip'
end
