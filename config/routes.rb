Rails.application.routes.draw do
  root 'roots#top'
  get '/about', to: 'roots#about'
  get '/admin_top', to: 'roots#admin_top'
  get '/maps', to: 'roots#map'

  get '/posts/hashtag/:name', to: 'posts#hashtag'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    member do
      get :following, :followers, :users_posts
    end
  end
  resources :relationships, only: [:create, :destroy]
  get "/following_posts", to: 'posts#indexf'


  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end