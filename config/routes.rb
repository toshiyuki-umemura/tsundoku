Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  root to: 'books#index'
  resources :books do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  resources :tags, param: :tag, only: [:show]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end