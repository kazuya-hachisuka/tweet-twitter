Rails.application.routes.draw do
  resources :tweets, only: [:new, :create, :index, :show, :edit,:destroy] do
  	resources :post_comments, only: [:create, :destroy]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'root#top'
  resources :users, only: [:show, :edit, :update, :index]
end
