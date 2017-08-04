Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'users', to: 'ads_items#index'
  get 'ads_items/user_page'
  scope "/:locale", locale: /en|ru/ do
    root 'ads_items#index'
    resources :ads_items
    devise_for :users
  end
  
  resources :ads_items do
    patch :set_approve
  end
end
