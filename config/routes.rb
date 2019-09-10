Rails.application.routes.draw do
  devise_for :users
  
  root to: "user#index"

  resources :promotions, only: %i[index show new create] do
    post 'apply', to: "cupons#apply"
    resources :cupons, only: %i[create] 
  end

  
  resources :administrator, only: %i[index] 
  resources :payments, only: %i[new create]

end
