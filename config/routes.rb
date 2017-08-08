Rails.application.routes.draw do
  
  get 'users', to: 'ads_items#index'
  get 'ads_items/user_page'
  get 'ads_items/index'
  

  scope "/:locale", locale: /en|ru/ do
    root 'ads_items#index'
    get 'ads_items', to: 'ads_items#index'
    resources :ads_items
    devise_for :users
    ActiveAdmin.routes(self)
  end
  
  resources :ads_items do
    patch :set_approve
  end
end
