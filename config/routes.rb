# require 'sidekiq/web'

Rails.application.routes.draw do
  resources :channels do
    resource :channel_user
    resources :messages
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'channels#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
