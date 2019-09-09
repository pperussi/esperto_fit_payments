Rails.application.routes.draw do
  devise_for :users
  
  root to: "user#index"

  resources :promotions, only: %i[index show new create] do
    resources :cupons, only: %i[create show ] do

    end
  end
  
  resources :administrator, only: %i[index] 
  resources :payments, only: %i[new create]

end
