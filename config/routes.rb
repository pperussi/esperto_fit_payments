Rails.application.routes.draw do
  devise_for :users

  root to: "user#index"

  resources :registrations

  resources :administrator, only: %i[index] 
  resources :pay_methods, only: %i[new create]

end
