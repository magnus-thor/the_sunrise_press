Rails.application.routes.draw do
  root controller: :articles, action: :index
  resources :articles, only: [:index, :show] do
    resources :comments
  end

  namespace :content_management do
    resources :articles 
    resources :users, only: [:index, :update]
  end
  
  devise_for :users  
  resources :categories, only: [:show]

  resources :subscribers, only: [:new, :create]
  

end
