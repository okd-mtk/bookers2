Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get 'home/about'=>'homes#about',as: 'about'
  
  
  resources :books, only: [:show, :index, :edit, :create, :destroy, :update]
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
