Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  devise_for :users



  #resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update]
  resources :post_images, only: [:new, :index, :show]

  # ネストさせる
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


  get "home/about"=>"homes#about"
  get "search" => "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end