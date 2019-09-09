Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "user#index"

  resources :administrator, only: %i[index] 
  resources :payments, only: %i[new create]
  resources :single_classes
  resources :clients  do
      get 'singleclass', on: :collection
      get 'search', on: :collection
  end

  # get 'search', to: 'client#search'

end
