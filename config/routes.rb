Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'ads_items/user_page'
  get 'ads_items/index'
  resources :ads_items
  root 'ads_items#index'

  resources :ads_items do
    patch :set_approve
  end
end
