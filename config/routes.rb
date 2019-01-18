Rails.application.routes.draw do
  root controller: :articles, action: :index
  resources :articles, only: [:index, :show]
  namespace :content_management do
    resources :articles 
  end
  
  devise_for :users  
  resources :categories, only: [:show]

  resources :subscribers, only: [:new, :create]
end
