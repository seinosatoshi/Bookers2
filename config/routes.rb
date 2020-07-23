Rails.application.routes.draw do
  devise_for :users
  root :to => "homes#top"
  get 'home/about' => "homes#about", as: :homes_about
  get '/search', to: 'searches#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  	resource :relationships, only: [:create, :destroy]
  	get 'follow' => 'relationships#follow', as: 'follow' # フォローする
    get 'unfollow' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  end
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
