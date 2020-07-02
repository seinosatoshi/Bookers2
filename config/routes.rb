Rails.application.routes.draw do
  get 'books/index'
  get 'books/new'
  get 'books/show'
  get 'books/edit'
  get 'books/update'
  get 'books/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  root :to => "homes#top"
  root 'post_images#index'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
