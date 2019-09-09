Rails.application.routes.draw do
  devise_for :users

  root to: "user#index"

  resources :promotions, only: %i[index show new create] do
    resources :cupons, only: %i[create]
  end
  
  resources :administrator, only: %i[index] 
  resources :pay_methods, only: %i[new create]
  resources :registrations, only: %i[index new create show edit update]
  resources :single_classes
  resources :clients  do
      get 'singleclass', on: :collection
      get 'search', on: :collection
  end

  # get 'search', to: 'client#search'
  
  
end
