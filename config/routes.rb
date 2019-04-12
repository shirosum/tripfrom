Rails.application.routes.draw do
  root 'roots#top'
  get '/about', to: 'roots#about'
  get '/admin_top', to: 'roots#admin_top'
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :posts
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end