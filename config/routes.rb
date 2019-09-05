Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  root to: "home#index"
  resources :promotions, only: %i[index show new create] do
    resources :cupons, only: %i[create]
  end
=======
  root to: "user#index"

  resources :administrator, only: %i[index] 
  resources :payments, only: %i[new create]

>>>>>>> master
end
