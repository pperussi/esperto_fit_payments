Rails.application.routes.draw do
  devise_for :users

  root to: "user#index"

  resources :promotions, only: %i[index show new create] do
    resources :cupons, only: %i[create]
  end
  
  resources :administrator, only: %i[index] 
  resources :pay_methods, only: %i[new create]
  resources :registrations, only: %i[index new create show edit update] do
    post 'paid', on: :member

  end

  resources :payments, only: [:show] do
    resources :payment_transactions, only: %i[new create show edit update destroy] do

      post 'unpaid', on: :member
    end
  end

  get 'search', to: 'registrations#search'
  
  namespace :api do
    namespace :v1 do
      resources :registrations do
        get "payments", on: :collection
      end
    end
  end

end
