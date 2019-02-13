Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    get :new, on: :collection
    post :follow, on: :member
    get :registercard, on: :member
    get :logout, on: :member
    get :edit, on: :member
    get :identification, on: :member
  end

  resources :items
  resources :orders
  resources :categories

end
