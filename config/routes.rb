Rails.application.routes.draw do
  devise_for :users

  get 'static_pages/home', to: 'static_pages#home', as: 'static_pages_home'
  get 'static_pages/eshop', to: 'static_pages#eshop', as: 'static_pages_eshop'
  get 'static_pages/prestations', to: 'static_pages#prestations', as: 'static_pages_prestations'
  get 'static_pages/about', to: 'static_pages#about', as: 'static_pages_about'
  get 'static_pages/team', to: 'static_pages#team', as: 'static_pages_team'
  get 'static_pages/contact', to: 'static_pages#contact', as: 'static_pages_contact'
  get 'eshop/eshop_index', to: 'eshop#eshop_index', as: 'eshop_index'
  get 'eshop/item/:id', to: 'eshop#show', as: 'eshop_item'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'static_pages#home'
end
