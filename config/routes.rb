Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"

  resources :items do
    resources :orders, only:[:index, :create] do
      resources :address
    end
  end
  resources :users
end
