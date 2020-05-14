Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :pictures, only: [:create]
  end
  resources :users
  resources :attendances
  resources :charges, only: [:new, :create]
end
