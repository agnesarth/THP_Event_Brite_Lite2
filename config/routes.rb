Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :attendances
    resources :pictures, only: [:new, :create]
  end

  namespace :admin do
    root 'admin#index'
    resources :users, :events
  end

  resources :users
  resources :charges, only: [:new, :create]
end
