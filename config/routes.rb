Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    resources :books
  end
  devise_for :users
  get 'ads_items/index'
  resources :ads_items
  root 'ads_items#index'
end
