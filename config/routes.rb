Rails.application.routes.draw do

  resources :flames
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users, only: [:show], as: :user

  root 'pages#home'
  get 'about', to: 'pages#about', as: :about
  get 'pages/awaiting_confirmation', as: :awaiting_confirmation

  resources :articles do
    resources :comments
  end

  resources :comments do
    resources :commentable
  end

end
