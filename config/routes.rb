Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :promotions, only: %i[index show new create] do
    resources :cupons, only: %i[create]
  end
end
