Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "user#index"

  resources :administrator, only: %i[index] 
  resources :payments, only: %i[new create]
  resources :client  do
      get 'singleclass', on: :member
  end

end
