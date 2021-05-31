# require 'sidekiq/web'

Rails.application.routes.draw do
  resources :channels do
    resource :channel_user
    resources :messages
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
# authenticate :user, lambda { |u| u.admin? } do
#   mount Sidekiq::Web => '/sidekiq'

#   namespace :madmin do
#     namespace :active_storage do
#       resources :blobs
#     end
#     namespace :active_storage do
#       resources :attachments
#     end
#     resources :users
#   end
# end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'channels#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
