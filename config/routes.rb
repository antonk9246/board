Rails.application.routes.draw do
  
  devise_for :users
  get 'ads_items/index'
  resources :ads_items
  root 'ads_items#index'
end
