Rails.application.routes.draw do
  devise_for :users

  root to: "user#index"

  resources :promotions, only: %i[index show new create] do
    resources :cupons, only: %i[create]
  end

  resources :administrator, only: %i[index]
  resources :pay_methods, only: %i[index new create]

  resources :single_classes,only: %i[show]

  resources :registrations, only: %i[index new create show edit update] do
    resources :single_classes,only: %i[new create]
    get 'search_single_class', on: :collection
    get 'search', on: :collection
  end

  namespace 'api' do
     namespace 'v1' do
       resources :pay_methods, only: %i[index]
     end
   end

end
