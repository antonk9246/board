Rails.application.routes.draw do
  resources :search_content_for, only: [:index]
  get 'ads_items/user_page'
  get 'ads_items/search'
  root 'ads_items#index'

  scope '/:locale', locale: /en|ru/ do
    get 'ads_items', to: 'ads_items#index'
    resources :ads_items
    devise_for :users
    
    resource :user, only: [:edit, :destroy] do
      collection do
        patch 'update_password'
        patch 'update_avatar'
        delete 'user_delete'
      end
    end
    ActiveAdmin.routes(self)
  end
  
  resources :ads_items do
    patch :to_new
    patch :approve
    patch :decline
    patch :return
  end
end
