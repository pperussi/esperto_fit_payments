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

  namespace :api ,defaults: { format: 'json' } do
    namespace :v1,defaults: { format: 'json' } do
      resources :payments, only: %i[show]
      resources :pay_methods, only: %i[index]
      resources :notifications, only: %i[show]
      resources :registrations do
        get "payments", on: :collection
      end
    end
  end
end
