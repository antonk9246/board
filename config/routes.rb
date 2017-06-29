Rails.application.routes.draw do
  get 'ads_items/index'
  resources :ads_items
  root 'ads_items#index'
end
