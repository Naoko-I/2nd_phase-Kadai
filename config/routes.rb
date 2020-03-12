Rails.application.routes.draw do
  get 'book_comments/destroy'
  # get 'favorites/create'
  # get 'favorites/destroy'
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    # ↑resources :books, only: [:new, :index, :edit, :update, :destroy, :create, :show] doと同じ意味。親子関係=ネストのための記述
   resource :book_comments, only: [:create, :destroy]
   resource :favorite, only: [:create,:destroy]
   # books do~endの中に2つのresourceを入れないとルーティングが変になる
  end
end
