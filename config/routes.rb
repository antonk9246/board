Rails.application.routes.draw do
  resources :search_content_for, only: [:index]
  get 'ads_items/user_page'
  root 'ads_items#index'
  scope '/:locale', locale: /en|ru/ do
    get 'ads_items', to: 'ads_items#index'
    resources :ads_items
    devise_for :users
    resource :user, only: [:edit] do
      collection do
        patch 'update_password'
        patch 'update_avatar'
      end
    end
    ActiveAdmin.routes(self)
  end
  
  resources :ads_items do
    patch :set_approve
  end
end
