Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :users

  root to: 'user#index'

  resources :promotions, only: %i[index show new create] do
    post 'apply', to: "cupons#apply"
    resources :cupons, only: %i[create]
  end

  resources :administrator, only: %i[index]
  resources :pay_methods, only: %i[index new create]
  resources :single_classes, only: %i[show]

  resources :registrations, only: %i[index new create show edit update] do
    resources :single_classes, only: %i[new create]
    get 'search_single_class', on: :collection
    get 'search', on: :collection
    post 'paid', on: :member
  end

  resources :payments, only: %i[show] do
    resources :payment_transactions, only: %i[new create show edit update destroy] do
      post 'unpaid', on: :member
    end
  end

  get 'search', to: 'registrations#search'

  namespace :api,defaults: { format: 'json' } do
    namespace :v1,defaults: { format: 'json' } do

      resources :promotions do
        post 'apply', to: "cupons#apply"
        resources :cupons, only: %i[]do 
          get 'validate', on: :member
          
        end
      end    

      resources :plans, only: %i[create show index]
      resources :unity, only: %i[create show index]
      resources :notifications, only: %i[create]
      resources :pay_methods, only: %i[index show create]
      resources :single_class, only: %i[create]
      resources :payments,only: %i[show] do
        post 'ban' , on: :collection
      end
      resources :registrations do
        get 'payments', on: :collection
      end
    end
  end
end


