Rails.application.routes.draw do
  get 'root/top'

resources :tweets

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'root#top'
  resources :users, only: [:show, :edit, :update, :index]
end
