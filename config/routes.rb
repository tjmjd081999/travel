Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'prefectures/index'
  root to: "prefectures#index"
  resources :users, only: [:new, :edit, :update] 
  resources :prefectures, only: [:index, :show]
  resources :articles, only: [:new, :create, :edit, :update, :destroy] 


  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
