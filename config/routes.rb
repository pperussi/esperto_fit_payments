Rails.application.routes.draw do
  devise_for :users

  root to: "user#index"

  resources :promotions, only: %i[index show new create] do
    resources :cupons, only: %i[create]
  end
  
  resources :administrator, only: %i[index] 
  resources :pay_methods, only: %i[new create]

  resources :single_classes,only: %i[show]

  resources :registrations, only: %i[index new create show edit update] do
    resources :single_classes,only: %i[new create]
    get 'search', on: :collection
  end
end