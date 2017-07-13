Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'ads_items/user_page'
  get 'ads_items/index'
  resources :ads_items
  root 'ads_items#index'
end
