Rails.application.routes.draw do
  devise_for :users

  root to: "user#index"

  resources :promotions, only: %i[index show new create] do
    post 'apply', to: "cupons#apply"
    resources :cupons, only: %i[create] 
  end

  
  resources :administrator, only: %i[index] 
  resources :pay_methods, only: %i[new create]
  resources :registrations, only: %i[index new create show edit update]

  get 'search', to: 'registrations#search'

end
