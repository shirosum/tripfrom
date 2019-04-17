Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'roots#top'
  get '/about', to: 'roots#about'
  get '/admin_top', to: 'roots#admin_top'
  get '/trip', to: 'roots#trip'
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end